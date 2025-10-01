@echo off
set batDir=%~dp0
cd %batDir%

cd
echo.
if exist del /Q HelloWord_unsigned.exe
echo.
gcc HelloWord.c -o HelloWord_unsigned.exe
echo.
dir HelloWord_unsigned.exe
echo.
pause
