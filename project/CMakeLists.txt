#********** start CmakeLists.txt **********

cmake_minimum_required(VERSION 3.5)

project(PROJECT_CPP)

#set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_BUILD_TYPE Release)

set(MY_PROGRAM myprog)

set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/bin)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

file(GLOB_RECURSE cpp_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
file(GLOB_RECURSE c_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)

ADD_EXECUTABLE(${MY_PROGRAM} ${cpp_SRCS} ${c_SRCS})

#********** end CmakeLists.txt **********