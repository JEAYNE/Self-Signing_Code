@echo off
setlocal
cd "%~dp0"
cls
set ESC=

set CAname=myRootCA

echo.
echo 1/2 Generate %CAname%.key private key
echo --------------------------------------
openssl genrsa -out data\%CAname%.key 4096
if %ERRORLEVEL% neq 0 (
  echo.
  echo %ESC%[31m ERROR generating private key for CA %ESC%[0m
  goto end
)
openssl rsa    -in  data\%CAname%.key -check -noout

echo.
echo 2/2 Use %CAname%.key and %CAname%.conf to generate %CAname%.crt certificate
echo ----------------------------------------------------------------------------
openssl req  -x509 -new -key data\%CAname%.key -config conf\%CAname%.conf -days 3650 -out data\%CAname%.crt
if %ERRORLEVEL% neq 0 (
  echo.
  echo %ESC%[31m ERROR generating certificate for CA %ESC%[0m
  goto end
)
openssl x509 -in data\%CAname%.crt -text -noout

echo.
echo Thumbprint (keep this value)
echo ----------------------------
openssl x509 -in data\myRootCA.crt -noout -fingerprint

:end
echo.
pause
endlocal
