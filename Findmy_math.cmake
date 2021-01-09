# Find library 
find_library(my_math_lib my_math
    HINTS /Users/userName/Documents/programming/cmake/06_install/installation
    PATH_SUFFIXES lib lib/my_math)

# Find include header (addition.h, division.h)
find_path(addition_header my_math/addition.h 
    HINTS /Users/userName/Documents/programming/cmake/06_install/installation
    PATH_SUFFIXES include include/my_math)

find_path(division_header my_math/division.h 
    HINTS /Users/userName/Documents/programming/cmake/06_install/installation
    PATH_SUFFIXES include include/my_math)

# Check if all components found and set my_math_found
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(my_math DEFAULT_MSG
    my_math_lib addition_header division_header)

# Set variables
if (my_math_FOUND)
    set(my_math_LIBRARIES ${my_math_lib})
    set(my_math_INCLUDE_DIRS ${addition_header} ${division_header})
    list(REMOVE_DUPLICATES my_math_INCLUDE_DIRS)
endif()
