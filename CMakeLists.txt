cmake_minimum_required(VERSION 3.22)

# Nombre del proyecto
project(
    PrometheusClientC
    VERSION 1.0.0
    DESCRIPTION "TP1"
    LANGUAGES C
)

# Establecer la versión de C
set(CMAKE_C_STANDARD 11)

# Incluir directorios
include_directories(${CMAKE_SOURCE_DIR}/include)
include_directories(${CMAKE_SOURCE_DIR}/../lib/prometheus-client-c/prom/include)
include_directories(${CMAKE_SOURCE_DIR}/../lib/prometheus-client-c/promhttp/include)

# Archivos fuente
file(GLOB SRC_FILES src/*.c)

# Crear la biblioteca estática (en lugar de un ejecutable)
add_library(tp1-s-op STATIC 
    src/expose_metrics.c 
    src/metrics.c 
    ${SRC_FILES}
)

# Incluir directorios de cabecera
target_include_directories(tp1-s-op PUBLIC
    ${CMAKE_SOURCE_DIR}/include               # Incluir el directorio general 'include'
    ${CMAKE_SOURCE_DIR}/lib/tp1-s.op/include  # Incluir el directorio de cabeceras del submódulo
    ${CMAKE_SOURCE_DIR}/../lib/prometheus-client-c/prom/include
    ${CMAKE_SOURCE_DIR}/../lib/prometheus-client-c/promhttp/include
)


# Vincular las bibliotecas necesarias
target_link_libraries(tp1-s-op PRIVATE pthread prom promhttp microhttpd)
