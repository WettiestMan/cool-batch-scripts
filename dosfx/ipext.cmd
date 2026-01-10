@echo off

setlocal EnableDelayedExpansion

if exist "%~1" (
	set "FILE=%~1"
	for %%f in (%~1) do set "FILEXT=%%~xf"

	for /f "usebackq delims=" %%t in (`powershell -noprofile -command "\"$env:FILEXT\".ToLower()"`) do (
		set "FILEXTLOW=%%t"
	)

	echo case_!FILEXTLOW!
	call :case_!FILEXTLOW! 2> nul
	if errorlevel 1 call :default

	echo Done 😊
	exit /b

    :case_.bz2
	:case_.tbz2
	    tar xvjf "%FILE%"
		goto finish
	:case_.gz
	:case_.tgz
	    tar xvzf "%FILE%"
		goto finish
	:case_.rar
	:case_.zip
	:case_.7z
		7z x "%FILE%"
		goto finish
	:default
	    echo Extensión no reconocida: !FILEXTLOW!
		goto finish
	:finish
	    ver > nul
		goto :EOF
)

echo %1 no es un archivo válido
