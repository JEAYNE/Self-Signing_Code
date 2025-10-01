@echo off
setlocal
cd "%~dp0"
cls
set ESC=

echo.
echo Bundle code_signing.key and code_signing.crt into code_signing.pfx
echo ------------------------------------------------------------------
echo.
echo   "Export Password" is the (optional) password to use for the final file.
echo   "Import Password" is the password used (if any) when creating the Certication-Request.
echo.
openssl pkcs12 -export -inkey data/code_signing.key -in data/code_signing.crt -out data/code_signing.pfx
if %ERRORLEVEL% neq 0 (
  echo.
  echo %ESC%[31m ERROR bundling private key and certificate %ESC%[0m
  goto end
)

echo.
openssl pkcs12 -info -nokeys -in data/code_signing.pfx

:end
echo.
pause
endlocal
