cmake -G "Visual Studio 17 2022" ^
  ../LibDSum ^
  -DCMAKE_INSTALL_PREFIX:STRING=C:/dev/3rdParty/Experiment/dlsbuild/Install ^
  -DCMAKE_DEBUG_POSTFIX:STRING=d ^
  -DLibSum_DIR:STRING=C:/dev/3rdParty/ExtTest/lib/cmake/LibSum
rem  -DLibSum_DIR:STRING=C:/dev/3rdParty/Experiment/lsbuild/Install/lib/cmake/LibSum


cmake --build . --config Debug
cmake --build . --config Release

cmake --install . --config Debug
cmake --install . --config Release
