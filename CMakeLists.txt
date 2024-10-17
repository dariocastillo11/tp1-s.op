cmake_minimum_required(VERSION 3.10)

# Project name
project(PrometheusClientC)

# Add subdirectoriesclea
add_subdirectory(../lib/prometheus-client-c/prom ${CMAKE_BINARY_DIR}/prom)
add_subdirectory(../lib/prometheus-client-c/promhttp ${CMAKE_BINARY_DIR}/promhttp)

# Include directories
include_directories(include) 
include_directories(../lib/prometheus-client-c/prom/include)
include_directories(../lib/prometheus-client-c/promhttp/include)

# Link directories
link_directories(${CMAKE_BINARY_DIR}../lib/prometheus-client-c/prom)
link_directories(${CMAKE_BINARY_DIR}../lib/prometheus-client-c/promhttp)

# Collect all .c files in src
file(GLOB SRC_FILES src/*.c)

# Add the main executable
add_executable(main_executable ${SRC_FILES})

# Link the libraries
target_link_libraries(main_executable prom promhttp)