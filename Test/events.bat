@echo off
setlocal enabledelayedexpansion

:loop
echo.
type accounts\%username%Resources\log.txt
echo.
set /p comm=<accounts\%username%Resources\command.txt
echo This will display current events.
set "line1=%comm%"

set speedGHOST=15
call :ghost
PING localhost -n 6 >NUL
cls
goto loop
:ghost
for /f %%a in ('"prompt $H&for %%b in (1) do rem"') do set "BS=%%a"
for /L %%a in (1,1,1) do set num=0&set "line=!line%%a!"&call :type
goto :EOF
:type
set "letter=!line:~%num%,1!"
set "delay=%random%%random%%random%%random%%random%%random%%random%"
set "delay=%delay:~-6%"
if not "%letter%"=="" set /p "=a%bs%%letter%" <nul
for /L %%b in (1,%speedGHOST%,%delay%) do rem
if "%letter%"=="" echo.&goto :EOF
set /a num+=1
goto :type