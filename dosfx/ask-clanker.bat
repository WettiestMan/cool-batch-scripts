@echo off
set "asked=%~1"

set ored=0
if "%asked%"=="/?" set /a ored=1
if "%asked%"=="-?" set /a ored=1
if "%asked%"=="--help" set /a ored=1
if "%asked%"=="-h" set /a ored=1
if "%asked%"=="h" set /a ored=1
if %ored% equ 1 (
	echo %~n0: use 'c' to invoke 'ChatGPT', 'a' to invoke 'Claude', or 'g' to invoke 'Gemini'
	exit /b 0
)

set url=
2>nul call :case_%asked%
if errorlevel 1 call :oops

exit /b

:case_c
    set url="https://chatgpt.com"
	goto end_case
:case_a
    set url="https://claude.ai"
	goto end_case
:case_g
    set url="https://gemini.google.com"
	goto end_case
:oops
    if [asked]==[] (
		echo %~n0: No param passed
	) else echo %~n0: Invalid param: %asked%
:end_case
    if %errorlevel% equ 0 start "" %url%
    goto :EOF
