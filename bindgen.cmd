@echo off
setlocal

call:download_C2CS_windows
call:bindgen
EXIT /B %errorlevel%

:exit_if_last_command_failed
if %errorlevel% neq 0 (
    exit %errorlevel%
)
goto:eof

:download_C2CS_windows
if not exist ".\C2CS.exe" (
    powershell -Command "(New-Object Net.WebClient).DownloadFile('https://nightly.link/lithiumtoast/c2cs/workflows/build-test-deploy/develop/win-x64.zip', '%cd%\win-x64.zip')"
    "C:\Program Files\7-Zip\7z.exe" x "%cd%\win-x64.zip" -o"%cd%"
    del "%cd%\win-x64.zip"
)
goto:eof

:bindgen
.\C2CS ast -i .\src\c\stb_image\main.h -o .\ast\stb_image.json -s .\ext\stb -b 64
call:exit_if_last_command_failed
.\C2CS cs -i .\ast\stb_image.json -o .\src\cs\production\stb_image-cs\stb_image.cs -l "stb_image" -c "stb_image" -a ^
 "stbi_uc -> byte"^
 "stbi_us -> ushort
call:exit_if_last_command_failed
goto:eof