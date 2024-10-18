cmake_minimum_required(VERSION 3.22)

# Nombre del proyecto
project(
    PrometheusClientC
    VERSION 1.0.0
    DESCRIPTION "TP1"
    LANGUAGES C
    )

#Set the C version
set(CMAKE_C_STANDARD 11)

# Incluir directorios

include_directories(${CMAKE_SOURCE_DIR}/../lib/prometheus-client-c/prom/include)
include_directories(${CMAKE_SOURCE_DIR}/../lib/prometheus-client-c/promhttp/include)


# Link directories
link_directories(${CMAKE_BINARY_DIR}/../lib/prometheus-client-c/prom)
link_directories(${CMAKE_BINARY_DIR}/../lib/prometheus-client-c/promhttp)



# Archivos fuente
file(GLOB SRC_FILES src/*.c)

# Crear el ejecutable
add_executable(main_executable src/main.c src/expose_metrics.c src/metrics.c ${SRC_FILES})

# Vincular las bibliotecas
target_link_libraries(main_executable -pthread prom promhttp microhttpd)
