@echo off
setlocal enabledelayedexpansion

set script_dir=%~dp0
echo Started building native libraries... Directory: %script_dir%

set build_dir=%script_dir%cmake-build-release
set lib_dir=%script_dir%lib

echo lib_dir: %lib_dir%

cmake -S %script_dir%\src\c\stb_image -B %build_dir% -A x64
cmake --build %build_dir% --config Release
if not exist %lib_dir% mkdir %lib_dir%

for %%f in (%build_dir%\Release\*.dll %build_dir%\Release\*.lib) do (
    set filepath=%%f
    set filename=%%~nf%%~xf
    set filepath_new=%lib_dir%\!filename!
    move /y !filepath! !filepath_new!
    echo Moved !filepath! to !filepath_new!
)

rmdir /s /q %build_dir%
