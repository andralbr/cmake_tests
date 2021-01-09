# Comment: To run file in script mode, exectute
# cmake -P myScriptFile.cmake

# ==================
# Printing
# ==================
message("This is a message")
#message(FATAL_ERROR "An error")
# Mode: WARNING, FATAL_ERROR, DEBUG, TRACE, VERBOSE, ...

# ==================
# Variables
# ==================

# Single variable
set(myVar value)
message("myVAR = ${myVar}")

# List
set(myList el1 el2 el3)

# ===================
# Cache variables
# ===================
set(myCacheVar "value" CACHE STRING "This is a test cache variable")
message("myCacheVar = $CACHE{myCacheVar}")
# Comment $CACHE{} can be replaced by ${} is no non-cache variable of identical name exists

# Changing cache variables:
# Once cache'd, subsequent commands do not inherently overwrite value
# Do
#   - edit CMakeCache.txt
#   - re-set with FORCE keyword
#   - cmake -DmyCacheVar="newValue"
set(myCacheVar "newValue" CACHE STRING "Modified cache var" FORCE)

# Selected cache variables:
# CMAKE_VERSION, CMAKE_MAJOR_VERSION, CMAKE_MINOR_VERSION, CMAKE_PATCH_VERSION,
# CMAKE_PROJECT_NAME, PROJECT_NAME, CMAKE_CURRENT_SOURCE_DIR, CMAKE_PREFIX_PATH
# CMAKE_GENERATOR


# =======================
# Environment variables
# =======================
set(ENV{myEnvVar} 15)
message(myEnvVar = $ENV{myEnvVar})


# ==================
# List operations
# ==================
list(APPEND myList el4)
# Modes: APPEND, INSERT, REMOVE_AT, REMOVE_ITEM, REVERSE, REMOVE_DUPLICATES,
# SORT, LENGTH, GET (sublist), JOIN
#[[
    list(APPEND myList el5 el6), list(INSERT myList 2 el), list(REMOVE_AT myList -2),
    list(REMOVE_ITEM myList el2), list(REVERSE myList), list(REMOVE_DUPLICATES myList),
    list(SORT myList),  list(LENGTH myList listLength), list(GET myList 0 2 3 subList),
    list(JOIN myList "::" joinedList) 
#]]

# =====================
# String manipulation
# =====================
set(myFiles file1.cpp file2.cpp file3.cpp)
string(REPLACE ".cpp" ".o" objFiles "${myFiles}")
foreach(objFile ${objFiles})
    message("objFile = ${objFile}")
endforeach()