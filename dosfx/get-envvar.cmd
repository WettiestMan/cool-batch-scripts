@echo off

setlocal enableextensions

if "%~1" neq "" (set "var=%~1") else (set var=DB_PASSWORD)
for /f "usebackq tokens=2 delims==" %%f in (`type .env ^| findstr %var%`) do echo %%f

endlocal
