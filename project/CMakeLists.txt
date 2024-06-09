#********** start CmakeLists.txt **********

cmake_minimum_required(VERSION 3.5)

project(PROJECT_CPP)

#set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_BUILD_TYPE Release)

set(MY_PROGRAM "$ENV{BIN_NAME_EXE}")

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

file(GLOB_RECURSE cpp_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
file(GLOB_RECURSE c_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
file(GLOB_RECURSE LIB_STATIC ${CMAKE_CURRENT_SOURCE_DIR}/lib/*.a)
file(GLOB_RECURSE LIB_DYNA ${CMAKE_CURRENT_SOURCE_DIR}/lib/*.so)

ADD_EXECUTABLE(${MY_PROGRAM} ${cpp_SRCS} ${c_SRCS})
TARGET_LINK_LIBRARIES(${MY_PROGRAM} ${LIB_STATIC} ${LIB_DYNA})

#********** end CmakeLists.txt **********