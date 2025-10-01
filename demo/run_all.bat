@echo off
setlocal
cd "%~dp0"
cls
set ESC=

call 1_myRootCA.bat
call 2_certification-request.bat
call 3_certify-the-request.bat
call 4_bundle.bat
call 5_sign-your-code.bat

cls
echo.
echo %ESC%[32m Now, you can check if data\HelloWord.exe is signed %ESC%[0m
echo.
pause
endlocal
