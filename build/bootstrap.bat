@echo off
set PLATFORM=x64
set VCPKG_DEFAULT_TRIPLET=%PLATFORM%-windows
git clone https://github.com/microsoft/vcpkg.git
cd vcpkg
call bootstrap-vcpkg.bat -disableMetrics
vcpkg install openssl lua zlib boost-system boost-regex boost-thread boost-serialization boost-chrono boost-date-time boost-signals2 boost-asio boost-logic boost-crc boost-assign boost-exception curl cereal pthreads mosquitto
cd ..
curl https://codeload.github.com/Kitware/CMake/tar.gz/v3.17.0 -o v3.17.0.tar.gz
tar -xvf v3.17.0.tar.gz
cd CMake-3.17.0
mkdir build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=..\..\vcpkg\scripts\buildsystems\vcpkg.cmake
MSBuild.exe CMake.sln /p:Configuration=Release /p:Platform="%PLATFORM%" -m
cd ..\..
