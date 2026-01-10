@echo off

REM ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
REM .dosrc.cmd. My AutoRun file 😊
REM
REM Feel free to use it if you want. It's quite small for the moment
REM
REM Bro is trying to get serious in basically MS-DOS in big 2025 🥀
REM ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo

REM setlocal enableextensions

REM this is meant to protect against FOR commands
REM invocating this .dosrc.cmd file and getting their output messed up
REM because of fastfetch
echo %CMDCMDLINE% | findstr /i "\/c " >nul
if %errorlevel%==0 exit /b

REM aliases usable in any moment
doskey poff=shutdown /s /t 0
doskey reboot=shutdown /r /t 0
doskey command=cmd $*
doskey command.com=cmd.exe $*
doskey git-bash="C:\Program Files\Git\bin\bash.exe" -i -l

REM aliases only usable for administrators (requires sudo for elevation).
REM If you are not running Windows 11, you can use any other sudo
REM (like gsudo)
where sudo.exe >nul 2>nul && (
    doskey gotobios=sudo shutdown /r /fw /t 0
    doskey fixpc=sudo call "%USERPROFILE%\fixme.bat"
)

where mingw32-make.exe > nul 2>&1 && (
    doskey make=mingw32-make.exe $*
)

REM Convenience scripts for CMD interactive sessions.
set "PATH=%PATH%;%USERPROFILE%\dosfx"

REM Cool prompt design
prompt $E[38;2;69;71;90m$E[48;2;245;194;231m[%username%@%userdomain%]$E[48;2;166;227;161m:$P$E[0m$E[38;2;137;180;250m$S$C$T$F$E[0m$_$$$S

REM fastfetch executed everytime I make a CMD. I think it's cool 😎
REM The 2>nul is in case I find myself on a machine that has no fastfetch
fastfetch 2>nul

echo on
