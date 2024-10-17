cmake_minimum_required(VERSION 3.10)

# Nombre del proyecto
project(PrometheusClientC)

# Añadir subdirectorios
add_subdirectory(../lib/prometheus-client-c/prom ${CMAKE_BINARY_DIR}/prom)
add_subdirectory(../lib/prometheus-client-c/promhttp ${CMAKE_BINARY_DIR}/promhttp)

# Incluir directorios
include_directories(include) 
include_directories(${CMAKE_SOURCE_DIR}/../lib/prometheus-client-c/prom/include)
include_directories(${CMAKE_SOURCE_DIR}/../lib/prometheus-client-c/promhttp/include)

# Link directories
link_directories(${CMAKE_BINARY_DIR}/lib/prometheus-client-c/prom)
link_directories(${CMAKE_BINARY_DIR}/lib/prometheus-client-c/promhttp)

# Archivos fuente
file(GLOB SRC_FILES src/*.c)

# Crear el ejecutable
add_executable(main_executable src/main.c src/expose_metrics.c src/metrics.c ${SRC_FILES})

# Vincular las bibliotecas
target_link_libraries(main_executable -pthread prom promhttp microhttpd)
