cmake_minimum_required(VERSION 3.16)

project(stb_image)

set(CMAKE_C_STANDARD 99)
set (CMAKE_SYSTEM_VERSION 10.0 (latest installed version))

get_filename_component(STB_DIRECTORY_PATH "../../../ext/stb" REALPATH BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
include_directories(${STB_DIRECTORY_PATH})

set(SOURCES "main.c")

add_library(stb_image SHARED ${SOURCES})
add_library(stb_image_s STATIC ${SOURCES})
target_compile_definitions(stb_image_s PRIVATE -DSTB_IMAGE_STATIC=1)
set_target_properties(stb_image_s PROPERTIES OUTPUT_NAME "stb_image")