cmake -G "Visual Studio 17 2022" ^
  ../LibSum ^
  -DCMAKE_INSTALL_PREFIX:STRING=C:/dev/3rdParty/Experiment/lsbuild/Install ^
  -DCMAKE_DEBUG_POSTFIX:STRING=d

cmake --build . --config Debug
cmake --build . --config Release

cmake --install . --config Debug
cmake --install . --config Release

cpack -G ZIP -C Debug;Release