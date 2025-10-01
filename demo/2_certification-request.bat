@echo off
setlocal
cd "%~dp0"
cls
set ESC=

echo.
echo Use the certification_request.conf configuration to generate
echo  - the request certification_request.csr
echo  - the private key code_signing.key
echo ------------------------------------------------------------

openssl req -new -newkey rsa:4096 -noenc -quiet -keyout data/code_signing.key -config conf/certification_request.conf -out data/certification_request.csr
if %ERRORLEVEL% neq 0 (
  echo.
  echo %ESC%[31m ERROR generating certification request %ESC%[0m
  goto end
)
echo.
openssl req -in data/certification_request.csr -noout -text

:end
echo.
pause
endlocal
