cmake_minimum_required(VERSION 3.28)
project(LibSum VERSION 1.2.3.5)

add_library(${PROJECT_NAME}
  sum.cpp
  include/sum.h
  include/private/sum_p.h
)

#public headers can be automatically installed
#set_target_properties(${PROJECT_NAME} PROPERTIES PUBLIC_HEADER include/sum.h)
#private headers can be automatically installed
#set_target_properties(${PROJECT_NAME} PROPERTIES PRIVATE_HEADER include/private/sum_p.h)

target_include_directories(${PROJECT_NAME}
  PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
  $<INSTALL_INTERFACE:headers>
)

include(GNUInstallDirs)

install(
  TARGETS ${PROJECT_NAME} 
  EXPORT ${PROJECT_NAME}Targets 
#  DESTINATION ""
)

install(FILES include/sum.h
#  DESTINATION include#${INCLUDES_INSTALL_DIR}
  DESTINATION headers#${INCLUDES_INSTALL_DIR}
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

##SET(CMAKE_INSTALL_SYSTEM_RUNTIME_DESTINATION "")
##include(InstallRequiredSystemLibraries)
##set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
#set(CPACK_PACKAGE_VERSION_MAJOR "${Test_VERSION_MAJOR}")
#set(CPACK_PACKAGE_VERSION_MINOR "${Test_VERSION_MINOR}")
#set(CPACK_GENERATOR "TGZ")
#set(CPACK_SOURCE_GENERATOR "TGZ")
include(CPack)
