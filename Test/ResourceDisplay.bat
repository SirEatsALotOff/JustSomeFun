@echo off
cls
title Resource Display
mode con: cols=20 lines=25
:loop
set /p shutdownyesno=<accounts\%username%Resources\command.txt
if "%shutdownyesno%"=="shutoffdisplay" exit
::break>file.txt clears files my dude
set /p happy=<accounts\%1Resources\mood\happiness.txt
set /p health=<accounts\%1Resources\mood\health.txt
set /p hostility=<accounts\%1Resources\mood\hostility.txt
set /p intelligence=<accounts\%1Resources\mood\intelligence.txt

set /p food=<accounts\%1Resources\realResource\food.txt
set /p steel=<accounts\%1Resources\realResource\steel.txt
set /p stone=<accounts\%1Resources\realResource\stone.txt
set /p wood=<accounts\%1Resources\realResource\wood.txt

set /p huts=<accounts\%1Resources\structures\huts.txt
set /p hovels=<accounts\%1Resources\structures\hovels.txt
set /p house=<accounts\%1Resources\structures\house.txt
set /p ranchHouse=<accounts\%1Resources\structures\ranchHouse.txt
set /p mansion=<accounts\%1Resources\structures\mansion.txt
set /p castle=<accounts\%1Resources\structures\castle.txt
::all values act as percentages.
::insert bars here
echo .....MOOD.....
echo %happy% happiness
echo %health% health
echo %hostility% hostility
echo %intelligence% intelligence
echo ...RESOURCE...
echo %food% food
echo %steel% steel
echo %stone% stone
echo %wood% wood
echo ...STRUCTURE...
echo %huts% huts
echo %hovels% hovels
echo %house% house
echo %ranchHouse% ranch house
echo %mansion% mansion
echo %castle% castle
PING localhost -n 6 >NUL
cls
goto loop