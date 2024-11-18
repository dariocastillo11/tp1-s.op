#include "expose_metrics.h"
#include <microhttpd.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
// #include "prometheus_client.h" // Asegúrate de incluir la cabecera correcta para prometheus

/** Mutex para sincronización de hilos */
pthread_mutex_t lock;

/** Métrica de Prometheus para el uso de CPU */
static prom_gauge_t* cpu_usage_metric;

/** Métrica de Prometheus para el uso de memoria */
static prom_gauge_t* memory_usage_metric;
static prom_gauge_t* disk_usage_metric;
static prom_gauge_t* active_processes_metric;
/** Métrica de Prometheus para el tráfico de red */
static prom_gauge_t* network_traffic_metric;

/** Métrica de Prometheus para los cambios de contexto */
static prom_gauge_t* context_switches_metric;

void update_cpu_gauge()
{
    double usage = get_cpu_usage();
    if (usage >= 0)
    {
        pthread_mutex_lock(&lock);
        prom_gauge_set(cpu_usage_metric, usage, NULL);
        pthread_mutex_unlock(&lock);
    }
    else
    {
        fprintf(stderr, "Error al obtener el uso de CPU\n");
    }
}

void update_memory_gauge()
{
    double usage = get_memory_usage();
    if (usage >= 0)
    {
        pthread_mutex_lock(&lock);
        prom_gauge_set(memory_usage_metric, usage, NULL);
        pthread_mutex_unlock(&lock);
    }
    else
    {
        fprintf(stderr, "Error al obtener el uso de memoria\n");
    }
}

void update_disk_gauge()
{
    double usage = get_disk_usage();
    if (usage >= 0)
    {
        pthread_mutex_lock(&lock);
        prom_gauge_set(disk_usage_metric, usage, NULL);
        pthread_mutex_unlock(&lock);
    }
}

void update_active_processes_gauge()
{
    double processes = get_active_processes();
    if (processes >= 0)
    {
        pthread_mutex_lock(&lock);
        prom_gauge_set(active_processes_metric, processes, NULL);
        pthread_mutex_unlock(&lock);
    }
}

void* expose_metrics(void* arg)
{
    (void)arg; // Argumento no utilizado

    // Aseguramos que el manejador HTTP esté adjunto al registro por defecto
    promhttp_set_active_collector_registry(NULL);

    // Iniciamos el servidor HTTP en el puerto 8000
    struct MHD_Daemon* daemon = promhttp_start_daemon(MHD_USE_SELECT_INTERNALLY, 8080, NULL, NULL);
    if (daemon == NULL)
    {
        fprintf(stderr, "Error al iniciar el servidor HTTP\n");
        return NULL;
    }
    else
    {
        printf("Servidor HTTP iniciado en puerto 8080\n");
    }
    // Mantenemos el servidor en ejecución
    while (1)
    {
        sleep(1);
    }

    // Nunca debería llegar aquí
    MHD_stop_daemon(daemon);
    return NULL;
}

void update_network_traffic_gauge()
{
    double traffic = get_network_traffic();
    if (traffic >= 0)
    {
        pthread_mutex_lock(&lock);
        prom_gauge_set(network_traffic_metric, traffic, NULL);
        pthread_mutex_unlock(&lock);
    }
    else
    {
        fprintf(stderr, "Error al obtener el tráfico de red\n");
    }
}

void update_context_switches_gauge()
{
    double switches = get_context_switches();
    if (switches >= 0)
    {
        pthread_mutex_lock(&lock);
        prom_gauge_set(context_switches_metric, switches, NULL);
        pthread_mutex_unlock(&lock);
    }
    else
    {
        fprintf(stderr, "Error al obtener los cambios de contexto\n");
    }
}

int init_metrics()
{

    pthread_mutex_init(&lock, NULL);
    // Inicializamos el registro de coleccionistas de Prometheus
    static int initialized = 0; // Variable para asegurar que se inicializa solo una vez
    if (!initialized)
    {
        if (prom_collector_registry_default_init() != 0)
        {
            fprintf(stderr, "Error al inicializar el registro de Prometheus\n");
            return EXIT_FAILURE;
        }
        initialized = 1; // Marcar como inicializado
    }
    // Crear las métricas de CPU y memoria
    cpu_usage_metric = prom_gauge_new("cpu_usage_percentage", "Porcentaje de uso de CPU", 0, NULL);
    memory_usage_metric = prom_gauge_new("memory_usage_percentage", "Porcentaje de uso de memoria", 0, NULL);
    disk_usage_metric = prom_gauge_new("disk_usage_percentage", "Porcentaje de uso de disco", 0, NULL);
    active_processes_metric = prom_gauge_new("active_processes", "Número de procesos activos", 0, NULL);
    // Verificar si se crearon correctamente
    if (!cpu_usage_metric || !memory_usage_metric || !disk_usage_metric || !active_processes_metric)
    {
        fprintf(stderr, "Error al crear las métricas\n");
        return EXIT_FAILURE;
    }
    // Registrar las métricas
    prom_collector_registry_must_register_metric(cpu_usage_metric);
    prom_collector_registry_must_register_metric(memory_usage_metric);
    prom_collector_registry_must_register_metric(disk_usage_metric);
    prom_collector_registry_must_register_metric(active_processes_metric);

    // Crear las métricas de tráfico de red y cambios de contexto
    network_traffic_metric = prom_gauge_new("network_traffic_bytes", "Tráfico de red en bytes", 0, NULL);
    context_switches_metric = prom_gauge_new("context_switches", "Número de cambios de contexto", 0, NULL);

    // Verificar si se crearon correctamente
    if (!network_traffic_metric || !context_switches_metric)
    {
        fprintf(stderr, "Error al crear las métricas de red o cambios de contexto\n");
        return EXIT_FAILURE;
    }

    // Registrar las métricas
    prom_collector_registry_must_register_metric(network_traffic_metric);
    prom_collector_registry_must_register_metric(context_switches_metric);

    printf("Métricas inicializadas correctamente\n");

    printf("registrado las métricas\n");

    return EXIT_SUCCESS; // Indica que todo se ha inicializado correctamente
}

void destroy_mutex()
{
    pthread_mutex_destroy(&lock);
}
