cmake_minimum_required(VERSION 3.0.0)

project(Calculator VERSION 1.0.0)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Option: dynamic library
option(DYNAMIC_MATH_LIB "Use dynamic math library" ON)

# Configuration file
configure_file(src/config.h.in config.h)

# TARGET 1 [lib]: my_math
add_subdirectory(src/math)

# TARGET 2 [lib]: my_print
add_subdirectory(src/io)

# TARGET 3 [exe]: calculator
add_executable(calculator
src/main.cpp)

# ... also include configuration file directory
target_include_directories(calculator PRIVATE "${PROJECT_BINARY_DIR}")

# ... add compile definitions
if ( APPLE )
    target_compile_definitions(calculator PRIVATE "IS_APPLE")
    target_compile_definitions(calculator PRIVATE SYS_NAME="${CMAKE_SYSTEM_NAME}")
endif()

# Link program
target_link_libraries(calculator my_math my_print)

# Custom command
#[[
add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/firstRun.txt
  COMMAND Calculator ${CMAKE_CURRENT_BINARY_DIR}/Table.h
  DEPENDS MakeTable
  )
#]]

# Install directory
message( "Install directory = ${CMAKE_INSTALL_PREFIX}")

# Do not add ${CMAKE_INSTALL_PREFIX}/bin, this would lead to a CPACK error
install(TARGETS calculator DESTINATION bin)

# Building installer
include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/src/License.txt")
set(CPACK_PACKAGE_VERSION_MAJOR "${Calculator_VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${Calculator_VERSION_MINOR}")
include(CPack)