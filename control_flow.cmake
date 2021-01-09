cmake_minimum_required(VERSION 3.0.0)

set(VAR TRUE)

if(VAR)
    message("Is true")
else()
    message("Is false")
endif()

# ------------
# Unary tests
# ------------
# Check if variable defined
set(name "myFile")
if(DEFINED name)
    message("Variable name is defined")
endif()

# Check if file exists
if(EXISTS ./CMakeLists.txt)
    message("File exists!")
else()
    message("File does not exist")
endif()

# Check if is a command
if(COMMAND target_link_libraries)
    message("Is a command!")
endif()

# --------------
# Binary tests
# --------------
# Test if strings are equal
set(file1 myFile.cpp)
set(file2 myfile.cpp)
if (file1 STREQUAL file2)
    message("file1 and file2 are equal")
endif()

# Combinations
if (NOT (file1 STREQUAL "myFile.cpp" OR file2 STREQUAL "myFile.cpp"))
    message("File not found!")
endif()


# ----------------
# While()
# ----------------
# Loop over list items
set(files file1.cpp file2.cpp file3.cpp)
foreach(file ${files})
    message("The filename is: ${file}")
endforeach()

# Loop over several lists
set(otherFiles file4.cpp file5.cpp)
foreach(file IN LISTS files otherFiles)
    message("The filename ist: ${file}")
endforeach()

# Range (opt.: end; start-end; start-end-stride)
foreach(x RANGE 10 13)
    message("x = ${x}")
endforeach()

set(test 0)
while(NOT test STREQUAL 3)
    message("test = ${test}")
    set(test 3)
endwhile()


# ------------------
# Functions
# -----------------
# Hint: Double dereferencing for content or function call with print($myName)
function(print name_var)
    message("The name is = ${${name_var}}")
endfunction()

set(Name myName)
print(Name)

# Comment prepending '_' can recover overwritten function

# Optional arguments
# ------------------
function (fancyPrint name_var)
    message("Number of arguments, ARGC = ${ARGC}")
    message("Arguments, ARGV = ${ARGV}")
    message("Number of optional args, ARGN = ${ARGN}")

    if(DEFINED ARGV0)
        message("ARGV0 = ${ARGV0}")
    endif()

    if(DEFINED ARGV1)
        message("ARGV1 = ${ARGV1}")
    endif()
endfunction()

fancyPrint(Bob Alice)


# "Returning" value
# ------------------
set(myVar 0)
function (myFunction val )
    set(myVar ${val} PARENT_SCOPE)
endfunction()

myFunction(7)
message("myVar = ${myVar}")

# IMPORTANT: Also add_Subdirectory introduces a new scope!

# --------------
# Macros
# -------------
# Like functions, but do not introduce a new scope
macro(myMacro)
    if(NOT DEFINED macroVar)
        set(macroVar initialized)
    endif()
endmacro()

myMacro()
message("macroVar = ${macroVar}")