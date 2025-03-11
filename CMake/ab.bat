cmake -G "Visual Studio 17 2022" ^
  ../App ^
  --install-prefix C:/dev/3rdParty/Experiment/abuild/Install ^
  -DCMAKE_DEBUG_POSTFIX:STRING=d ^
  -DLibDSum_DIR:STRING=C:/dev/3rdParty/Experiment/dlsbuild/Install/lib/cmake/LibDSum ^
  -DLibSum_DIR:STRING=C:/dev/3rdParty/ExtTest/lib/cmake/LibSum
rem  -DLibSum_DIR:STRING=C:/dev/3rdParty/Experiment/lsbuild/Install/lib/cmake/LibSum

cmake --build . --config Debug
cmake --build . --config Release

rem cmake --install . --config Debug
rem cmake --install . --config Release
