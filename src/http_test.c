#include <microhttpd.h>
#include <stdio.h>

#define PORT 8000

#include <microhttpd.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

// Otras funciones...

// Función para manejar las respuestas a las conexiones HTTP
enum MHD_Result answer_to_connection(void *cls, struct MHD_Connection *connection,
                                     const char *url, const char *method,
                                     const char *version, const char *upload_data,
                                     size_t *upload_data_size, void **con_cls) {
    char response_buffer[512]; // Buffer para la respuesta de métricas
    struct MHD_Response *response;
    int ret;

    // Obtener métricas
    double cpu_usage = get_cpu_usage();
    double memory_usage = get_memory_usage();

    // Formatear la respuesta en el formato de Prometheus
    snprintf(response_buffer, sizeof(response_buffer),
             "# HELP cpu_usage_percentage Porcentaje de uso de CPU\n"
             "# TYPE cpu_usage_percentage gauge\n"
             "cpu_usage_percentage %.2f\n"
             "# HELP memory_usage_percentage Porcentaje de uso de memoria\n"
             "# TYPE memory_usage_percentage gauge\n"
             "memory_usage_percentage %.2f\n",
             cpu_usage, memory_usage);

    // Crear la respuesta
    response = MHD_create_response_from_buffer(strlen(response_buffer), (void *)response_buffer, MHD_RESPMEM_PERSISTENT);
    ret = MHD_queue_response(connection, MHD_HTTP_OK, response);
    MHD_destroy_response(response);
    return ret;
}


int main()
{
    struct MHD_Daemon *daemon;

    daemon = MHD_start_daemon(MHD_USE_SELECT_INTERNALLY, PORT, NULL, NULL,
                              &answer_to_connection, NULL, MHD_OPTION_END);
    if (NULL == daemon)
    {
        fprintf(stderr, "Error al iniciar el servidor HTTP\n");
        return 1;
    }

    printf("Servidor HTTP iniciado en el puerto %d\n", PORT);

    getchar(); // Mantener el servidor corriendo hasta que el usuario presione Enter

    MHD_stop_daemon(daemon);
    return 0;
}
