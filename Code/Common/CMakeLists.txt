SET(BTKCommon_SRCS
  btkAcquisition.cpp
  btkAnalog.cpp
  btkDataObject.cpp
  btkEvent.cpp
  btkForcePlatform.cpp
  btkLogger.cpp
  btkPoint.cpp
  btkMetaData.cpp  
  btkMetaDataInfo.cpp
  btkMetaDataUtils.cpp 
  btkIMU.cpp
  btkObject.cpp
  btkProcessObject.cpp
  btkTriangleMesh.cpp
  btkWrench.cpp
)

ADD_LIBRARY(BTKCommon ${BTK_LIBS_BUILD_TYPE} ${BTKCommon_SRCS})
target_include_directories(BTKCommon PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
  $<INSTALL_INTERFACE:${BTK_INSTALL_INCLUDE_DIR}/Common>
)
target_include_directories(BTKCommon PUBLIC
  $<BUILD_INTERFACE:${BTK_SOURCE_DIR}/Utilities/eigen3>
  $<INSTALL_INTERFACE:${BTK_INSTALL_INCLUDE_DIR}/Utilities>
)
target_include_directories(BTKCommon PUBLIC
  $<BUILD_INTERFACE:${BTK_BINARY_DIR}>
  $<INSTALL_INTERFACE:${BTK_INSTALL_INCLUDE_DIR}>
)
SET(BTK_LIBRARIES ${BTK_LIBRARIES} "BTKCommon" CACHE INTERNAL "BTK modules compiled") # MUST BE THE FIRST COMPILED LIBRARY

IF(BTK_LIBRARY_PROPERTIES)
  SET_TARGET_PROPERTIES(BTKCommon PROPERTIES ${BTK_LIBRARY_PROPERTIES})
ENDIF(BTK_LIBRARY_PROPERTIES)

IF(NOT BTK_INSTALL_NO_LIBRARIES)
  INSTALL(TARGETS BTKCommon
    RUNTIME DESTINATION ${BTK_INSTALL_BIN_DIR} COMPONENT RuntimeLibraries
    LIBRARY DESTINATION ${BTK_INSTALL_LIB_DIR} COMPONENT RuntimeLibraries
    ARCHIVE DESTINATION ${BTK_INSTALL_LIB_DIR} COMPONENT Development)
ENDIF(NOT BTK_INSTALL_NO_LIBRARIES)

IF(NOT BTK_INSTALL_NO_DEVELOPMENT)
  FILE(GLOB __files "${CMAKE_CURRENT_SOURCE_DIR}/*.h")
  FILE(GLOB __private "${CMAKE_CURRENT_SOURCE_DIR}/*_p.h")
  IF (__private) 
    LIST(REMOVE_ITEM __files ${__private})
  ENDIF (__private)
  INSTALL(FILES ${__files}
    DESTINATION ${BTK_INSTALL_INCLUDE_DIR}/Common
    COMPONENT Development)
ENDIF(NOT BTK_INSTALL_NO_DEVELOPMENT)
