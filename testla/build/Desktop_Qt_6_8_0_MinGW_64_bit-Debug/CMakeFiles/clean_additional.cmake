# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\apptestla_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\apptestla_autogen.dir\\ParseCache.txt"
  "apptestla_autogen"
  )
endif()
