cmake_minimum_required(VERSION 3.28)
project(LibMul VERSION 1.2.3.5)

add_library(${PROJECT_NAME} mul.cpp mul.h)

target_include_directories(${PROJECT_NAME}
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
  $<INSTALL_INTERFACE:headers>
)

