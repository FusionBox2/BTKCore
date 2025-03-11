cmake_minimum_required(VERSION 3.28)
project(App VERSION 1.2.3.5)

find_package(LibDSum REQUIRED CONFIG)

add_executable(${PROJECT_NAME} main.cpp)

target_link_libraries(${PROJECT_NAME} LibDSum::LibDSum LibDSum::LibMul)

install(
  TARGETS ${PROJECT_NAME}
  RUNTIME DESTINATION "."
)

SET(CMAKE_INSTALL_SYSTEM_RUNTIME_DESTINATION "")
##include(InstallRequiredSystemLibraries)
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
#set(CPACK_PACKAGE_VERSION_MAJOR "${Test_VERSION_MAJOR}")
#set(CPACK_PACKAGE_VERSION_MINOR "${Test_VERSION_MINOR}")
#set(CPACK_GENERATOR "TGZ")
#set(CPACK_SOURCE_GENERATOR "TGZ")
include(CPack)
