@echo off
setlocal
cd "%~dp0"
cls
set ESC=

rem Update this path depending on your configuration
set SDK=C:\Program Files (x86)\Windows Kits\10\bin\10.0.26100.0\x64

if not exist "%SDK%\signtool.exe" (
  echo %ESC%[31m ERROR: Either the SDK is not installed %ESC%[0m
  echo %ESC%[31m or signtool.exe is not installed in "%SDK%" %ESC%[0m
  goto end
)

echo.
echo Signing HelloWord.exe
echo ---------------------

cp HelloWord/HelloWord_unsigned.exe data/HelloWord.exe
"%SDK%\signtool" sign /debug /fd sha256 /f data/code_signing.pfx /tr http://timestamp.digicert.com /td sha256 data/HelloWord.exe
if %ERRORLEVEL% neq 0 (
  echo.
  echo %ESC%[31m ERROR signing file %ESC%[0m
  goto end
)

:end
echo.
pause
endlocal
