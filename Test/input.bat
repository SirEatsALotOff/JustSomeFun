@echo off
cls
(set check="£" "^^" "&" "$" "%%" "(" ")" "_" "-" "+" "^~" "|" "\" "<" "." ";" "@" "'" "^~" "#" "{" "}" "[" "]")
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
For %%a in (%check%) Do (
if not !test:%%~a=X!==!test! goto :newAccountConfirm
)
set /p "passwordTest= New Password?   "
For %%a in (%check%) Do (
if not !test:%%~a=X!==!test! goto :newAccountConfirmError
)
echo %passwordTest%>accounts\%newUser%.txt
goto success
:success
cls
echo Signed in successfully




pause



