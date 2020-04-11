@echo off
CMake-3.17.0\build\bin\Release\cmake -DCMAKE_TOOLCHAIN_FILE=vcpkg\scripts\buildsystems\vcpkg.cmake -DVCPKG_TARGET_TRIPLET=%VCPKG_DEFAULT_TRIPLET% -DUSE_BUILTIN_MQTT=NO -DMQTT_LIBRARIES=%CD%\vcpkg\installed\%VCPKG_DEFAULT_TRIPLET%\lib\mosquitto.lib -DMQTT_INCLUDE_DIRS=%CD%\vcpkg\installed\%VCPKG_DEFAULT_TRIPLET%\include -DCMAKE_CXX_FLAGS="/MP" -DCMAKE_C_FLAGS="/MP" ..
MSBuild.exe domoticz.sln /p:Configuration=Release /p:Platform="%PLATFORM%" -m
