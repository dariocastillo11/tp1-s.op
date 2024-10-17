/**
 * @file main.c
 * @brief Entry point of the system
 */
#include "/home/dario/Escritorio/tp jueves/so-i-24-dariocastillo11/include/expose_metrics.h"
// #include "expose_metrics.h"
#include <stdbool.h>

#define SLEEP_TIME 1

int main()
{

    // init_metrics();

    if (init_metrics() != EXIT_SUCCESS)
    {
        fprintf(stderr, "Error al inicializar las metricas\n");
        return EXIT_FAILURE; // Salir si la inicialización falla
    }
    fprintf(stderr, "metricas inicializadas\n");

    // Creamos un hilo para exponer las métricas vía HTTP
    pthread_t tid;
    if (pthread_create(&tid, NULL, expose_metrics, NULL) != 0)
    {
        fprintf(stderr, "Error al crear el hilo del servidor para exponer metricas HTTP\n");
        return EXIT_FAILURE;
    }
    fprintf(stderr, "hilo creado con exito\n");
    // Bucle principal para actualizar las métricas cada segundo
    while (true)
    {
        // fprintf(stderr, "entro al while\n");
        update_cpu_gauge();
        update_memory_gauge();
        update_disk_gauge();             // Nueva métrica de disco
        update_active_processes_gauge(); // Nueva métrica de procesos
        update_network_traffic_gauge();
        update_context_switches_gauge();

        
        sleep(SLEEP_TIME);
    }
    fprintf(stderr, "  FIN\n");
    return 0;
}