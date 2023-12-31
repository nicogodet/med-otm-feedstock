:: https://github.com/scivision/mumps/blob/main/Readme_Windows.md
:: Generate build files
set CXXFLAGS=-std=c++11
cmake -G "MinGW Makefiles" ^
      -B build ^
      -D CMAKE_BUILD_TYPE:STRING=RELEASE ^
      -D CMAKE_PREFIX_PATH:PATH=%LIBRARY_PREFIX%\mingw-w64 ^
      -D CMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX%\mingw-w64 ^
      -D MEDFILE_BUILD_TESTS:BOOL=OFF ^
      -D MEDFILE_INSTALL_DOC:BOOL=OFF ^
      -D MEDFILE_BUILD_SHARED_LIBS:BOOL=ON ^
      -D MEDFILE_BUILD_STATIC_LIBS:BOOL=OFF ^
      -D MEDFILE_USE_MPI:BOOL=ON ^
      -D H5_USE_110_API:BOOL=ON

:: Build
cmake --build build --parallel
cmake --install build

del /q %PREFIX%\mingw-w64\bin\mdump %PREFIX%\mingw-w64\bin\xmdump
copy /y %LIBRARY_PREFIX%\mingw-w64\bin\mdump4.exe %LIBRARY_PREFIX%\mingw-w64\bin\mdump.exe
copy /y %LIBRARY_PREFIX%\mingw-w64\bin\xmdump4.exe %LIBRARY_PREFIX%\mingw-w64\bin\xmdump.exe
move %LIBRARY_PREFIX%\mingw-w64\lib\*.dll %LIBRARY_PREFIX%\mingw-w64\bin\
