message("Test struct")


function( getInfo )
    set(options "")
    set(oneValueArgs GIT_REL_PATH GIT_ABS_PATH GIT_COMMIT SOURCE_DIR BUILD_DIR INSTALL_DIR)
    set(multiValueArgs "")
    
    if ( ${ARGC} LESS 1 )
        message(FATAL ERROR "(Function: getInfo) Not enough input arguments.")
    endif( )
    message("packageName = ${ARGV0}") 

    cmake_parse_arguments(PARSE_ARGV 1 GETINFO "${options}" "${oneValueArgs}" "${multiValueArgs}")

    if ( DEFINED GETINFO_UNPARSED_ARGUMENTS )
        message( FATAL_ERROR "(Function: getInfo) Unknown arguments: ${GETINFO_UNPARSED_ARGUMENTS}")
    endif()

    if ( DEFINED GETINFO_KEYWORDS_MISSING_VALUES )
        message( FATAL_ERROR "(Function: getInfo) The following keywords have missing values: ${GETINFO_KEYWORDS_MISSING_VALUESs}")
    endif()

    if ( DEFINED GETINFO_GIT_REL_PATH )    
        message("-- GIT_REL_PATH = ${GETINFO_GIT_REL_PATH}")
    endif() 
    if( DEFINED GETINFO_GIT_ABS_PATH ) 
        message("-- GIT_ABS_PATH = ${GETINFO_GIT_ABS_PATH}")    
    endif()
    if ( DEFINED GETINFO_SOURCE_DIR )
        message("-- SOURCE_DIR = ${GETINFO_SOURCE_DIR}")
    endif()
    if ( NOT ${GETINFO_KEYWORDS_MISSING_VALUE} STREQUAL "")
        message( FATAL_ERROR "(Function getInfo) Missing arguments for the following key(s): ${GETINFO_KEYWORDS_MISSING_VALUE}" )
    endif()

endfunction()



getInfo( myPackage GIT_ABS_PATH "/my/cool/path" SOURCE_DIR "/my/src/dir")