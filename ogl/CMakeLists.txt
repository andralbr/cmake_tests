#########################################
## Importing glfw lib via ..Config.cmake
## and subdirectory
#########################################


# Specifiy minimum cmake version
cmake_minimum_required(VERSION 3.13.0)

# Project
project(Cubes VERSION 1.0.0)

# C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# ------------------------
# Libraries
# ------------------------

# GLFW
# -----
# Get package information from glfw3Config.cmake
# => imports target glfw (library)
set(glfw3_DIR "/Users/userName/Documents/programming/OpenGL/libs/glfw-3.3.2/macos_build/lib/cmake/glfw3" 
    CACHE FILEPATH "Path to glfw config")
find_package(glfw3 REQUIRED)

if (NOT glfw3_FOUND)
    message(FATAL_ERROR "glfw3 library not found")
else()    # if(TARGET glfw)
    message("glfw library found")
endif()

# GLM
# -----
find_path(GLM_INCLUDE_DIR "glm/glm.hpp" 
    HINTS /Users/userName/Documents/programming/OpenGL/libs/glm
    PATH_SUFFIXES include include/glm REQUIRED)

if (GLM_INCLUDE_DIR)
    message("GLM_INCLUDE_DIR = ${GLM_INCLUDE_DIR}")
endif()

# GLAD
# -------
find_path(GLAD_INCLUDE_DIR "glad/glad.h" 
    HINTS /Users/userName/Documents/programming/OpenGL/libs/glad
    PATH_SUFFIXES include include/glm REQUIRED)

if (GLAD_INCLUDE_DIR)
    message("GLAD_INCLUDE_DIR = ${GLAD_INCLUDE_DIR}")
endif()

# -----------------------
# tools library
# ------------------------
add_subdirectory( src/tools )


# -----------------------
# Source files
# ------------------------

set(SRC_FILES 
    src/main.cpp)

set(SRC_INCLUDE 
    ${CMAKE_CURRENT_SOURCE_DIR}/src )


# ------------------------
# Target executable
# ------------------------
# Add executable
add_executable(cubes ${SRC_FILES})  

# Set include directories
target_include_directories(cubes PRIVATE ${SRC_INCLUDE} ${GLM_INCLUDE_DIR} ${GLAD_INCLUDE_DIR}) 

# Link libraries
target_link_libraries(cubes PRIVATE glfw tools)


# -------------------------
# Install 
# -------------------------
# Set CMAKE_INSTALL_PREFIX for install path other than /usr/local
install(TARGETS cubes DESTINATION bin )



