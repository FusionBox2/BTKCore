cmake_minimum_required(VERSION 3.28)
project(LibDSum VERSION 1.2.3.5)

find_package(LibSum REQUIRED)

add_subdirectory(Mul)
add_library(${PROJECT_NAME} dsum.cpp include/dsum.h)

target_link_libraries(${PROJECT_NAME} PUBLIC LibSum::LibSum)

target_include_directories(${PROJECT_NAME}
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:headers>
)

include(GNUInstallDirs)

install(
  TARGETS ${PROJECT_NAME}
  EXPORT ${PROJECT_NAME}Targets 
  COMPONENT DSum
#  DESTINATION ""
)

install(
  TARGETS LibMul
  EXPORT ${PROJECT_NAME}Targets 
  COMPONENT Mul
#  DESTINATION ""
)

install(FILES include/dsum.h
#  DESTINATION include#${INCLUDES_INSTALL_DIR}
  DESTINATION headers#${INCLUDES_INSTALL_DIR}
  COMPONENT DSum
)
install(FILES Mul/mul.h
#  DESTINATION include#${INCLUDES_INSTALL_DIR}
  DESTINATION headers#${INCLUDES_INSTALL_DIR}
  COMPONENT Mul
)
set(TARGETS_EXPORT_NAME ${PROJECT_NAME}Targets)
install(EXPORT ${TARGETS_EXPORT_NAME}
        NAMESPACE "${PROJECT_NAME}::"
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
#non gnu        DESTINATION lib/cmake/${PROJECT_NAME}
)

include(CMakePackageConfigHelpers)
configure_package_config_file(${PROJECT_NAME}Config.cmake.in
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
  INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
#  PATH_VARS INCLUDE_INSTALL_DIR SYSCONFIG_INSTALL_DIR
)
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
  VERSION 1.2.3
  COMPATIBILITY SameMajorVersion )
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
              ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
)
