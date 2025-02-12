@echo off
title Secure Horizon [MR.C005]
color 0A
cls

:: Author Information
echo ==================================================
echo      Windows Remote Desktop - Secure Access
echo ==================================================
echo   Author: Secure Horizon [ M.R.C005 ]
echo   GitHub: github.com/chamidu200
echo   Telegram: t.me/hackingword24
echo   YouTube: https://www.youtube.com/@chamidunimsara20052
echo ==================================================
echo.

:: Redirect to YouTube Channel
start https://www.youtube.com/@chamidunimsara20052

@echo off
start "" "SECURE.scr"

@echo off
start "" "Horizon.png"

:: Get Remote Host/IP
:host
set /p host="Enter Remote Host/IP (or type EXIT to quit): "
if "%host%"=="EXIT" exit
if "%host%"=="" (
    echo [ERROR] Host/IP cannot be empty!
    goto host
)

:: Get Username
:user
set /p user="Enter Username: "
if "%user%"=="" (
    echo [ERROR] Username cannot be empty!
    goto user
)

:: Get Password (Hidden Input)
setlocal ENABLEEXTENSIONS
setlocal ENABLEDELAYEDEXPANSION
echo Enter Password (input will be hidden):
set "pass="
for /f "delims=" %%p in ('powershell -Command "$pword = Read-Host 'Password' -AsSecureString; [Runtime.InteropServices.Marshal]::PtrToStringAuto([Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword))"') do set "pass=%%p"

:: Store Credentials
cmdkey /add:%host% /user:%user% /pass:%pass% >nul
if %errorlevel% neq 0 (
    echo [ERROR] Failed to store credentials!
    pause
    exit
)

:: Establish RDP Connection
echo Connecting to %host% ...
mstsc /v:%host%
if %errorlevel% neq 0 (
    echo [ERROR] Remote Desktop Connection failed!
    pause
)

:: Cleanup Credentials
cmdkey /delete:%host% >nul
echo Credentials cleared for security.
echo.

:: End Script
pause
exit
