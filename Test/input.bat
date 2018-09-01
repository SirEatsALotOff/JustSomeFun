@echo off
cls
setlocal enabledelayedexpansion
:start
set confirmNewAccount=0
set "passwordTest="
set "username="
set "password="
set "newUser="
echo Enter an existing username, or leave blank to create a new account.
set /p "username=account name?   "
if exist accounts\%username%.txt goto next
if "%username%"=="" goto newAccount
echo account doesn't exist boy
pause>NUL
cls
goto start
:next
set /p password=<accounts\%username%.txt
set /p "passwordTest= What's your password?   "
if "%passwordTest%"=="%password%" goto success
echo There was an error processing your request.
echo Redirecting in...
TIMEOUT /T 3 /NOBREAK
cls
goto start
:newAccount
echo.
echo.
echo Are you sure you want to create a new account?
set /p "confirmNewAccount= (yes/no)~"
if "%confirmNewAccount%"=="yes" goto newAccountConfirm
cls
goto start
:newAccountConfirmError
cls
echo Error detected. Please use only valid characters and no spaces.
:newAccountConfirm
set /p "newUser= New Username?   "
set /p "passwordTest= New Password?   "
echo %passwordTest%>accounts\%newUser%.txt
mkdir accounts\%newUser%Resources\mood
echo 0 >accounts\%newUser%Resources\mood\happiness.txt
echo 0 >accounts\%newUser%Resources\mood\health.txt
echo 0 >accounts\%newUser%Resources\mood\hostility.txt
echo 0 >accounts\%newUser%Resources\mood\intelligence.txt
mkdir accounts\%newUser%Resources\realResource
mkdir accounts\%newUser%Resources\structures
echo 0 >accounts\%newUser%Resources\realResource\food.txt
echo 0 >accounts\%newUser%Resources\realResource\steel.txt
echo 0 >accounts\%newUser%Resources\realResource\stone.txt
echo 0 >accounts\%newUser%Resources\realResource\wood.txt
echo 0 >accounts\%newUser%Resources\structures\huts.txt
echo 0 >accounts\%newUser%Resources\structures\hovels.txt
echo 0 >accounts\%newUser%Resources\structures\house.txt
echo 0 >accounts\%newUser%Resources\structures\ranchHouse.txt
echo 0 >accounts\%newUser%Resources\structures\mansion.txt
echo 0 >accounts\%newUser%Resources\structures\castle.txt
set "username=%newUser%"
pause
goto success
:success
echo nothingtoseehere>accounts\%username%Resources\command.txt
cls
echo Signed in successfully
echo.
echo Opening external displays...
echo Feel free to organize them as you like.
echo.
start ResourceDisplay.bat %username%
start events.bat %username%
cls
:commandloop
cls
mode con: cols=90 lines=15
set "inputBox="
set /p "inputBox= Command (type help for a list of commands)   "
if "%inputBox%"=="help" (
type data\help.txt
echo.
pause
goto commandloop
)
if "%inputBox%"=="logout" (
echo shutoffdisplay>accounts\%username%Resources\command.txt
goto start

)
if "%inputBox%"=="startDisplay" (start ResourceDisplay.bat %username%)
echo %inputBox%>accounts\%username%Resources\command.txt
goto commandloop
