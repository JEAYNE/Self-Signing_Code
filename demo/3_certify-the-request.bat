@echo off
setlocal
cd "%~dp0"
cls
set ESC=

echo.
echo Use the private CA (myRootCA.key and .crt) to
echo  - certify the request certification_request.csr
echo  - generate the certificate code_signing.crt
echo ------------------------------------------------

openssl x509 -req -CA data/myRootCA.crt -CAkey data/myRootCA.key -days 4000 ^
             -in data/certification_request.csr -out data/code_signing.crt
if %ERRORLEVEL% neq 0 (
  echo.
  echo %ESC%[31m ERROR generating the certificate for code signing %ESC%[0m
  goto end
)
echo.
openssl x509 -in data/code_signing.crt -text -noout

:end
echo.
pause
endlocal
