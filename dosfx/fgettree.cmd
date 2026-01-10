@echo off

if "%~1"=="" (
	echo Uso: 1>&2
	echo     fgettree ^<archivo^> [raíz] 1>&2
	echo Si [raíz] no es especificado, se usará "src" por defecto 1>&2
	exit /b 1
)

if "%~1"=="/?" (
	echo fgettree: Busca esquemas de árboles de directorios en
	echo archivos de texto.
	echo.
	echo Uso:
	echo     fgettree ^</?^|^<archivo^>^> [raíz]
	echo Donde:
	echo(    /?: Muestra esta ayuda
	echo     archivo: el archivo en el cual se van a buscar árboles
	echo     raíz: el nombre del directorio raíz del árbol (sin '/'^)
	echo.
	echo Si [raíz] no es especificado, se usará "src" por defecto
    exit /b 0
)

if not exist "%~1" (
	echo No se pudo encontrar el archivo especificado 1>&2
	exit /b 1
)

set target=%~1

if "%~2" neq "" (set treeroot=%~2) else set treeroot=src

type "%target%" | findstr /r "^%treeroot%$" & type "%target%" | findstr /r "[├└│─]"

exit /b 0
