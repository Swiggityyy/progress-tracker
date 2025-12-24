@echo off
REM Progress Tracker Server Launcher for Windows
REM This script starts a simple HTTP server to make the progress tracker accessible on your local network

setlocal enabledelayedexpansion

set PORT=8000

echo ==================================
echo  Progress Tracker Server Starting
echo ==================================
echo.

REM Change to the script's directory
cd /d "%~dp0"

REM Get local IP address
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4 Address"') do (
    set IP=%%a
    set IP=!IP:~1!
    goto :found
)
:found

if "%IP%"=="" (
    set IP=localhost
)

echo Server started successfully!
echo.
echo Access your progress tracker:
echo   - On this computer: http://localhost:%PORT%
echo   - On your network:  http://%IP%:%PORT%
echo.
echo To access from other devices on your network:
echo   1. Make sure devices are on the same WiFi/network
echo   2. Open a browser and go to: http://%IP%:%PORT%
echo   3. Bookmark it for easy access!
echo.
echo Press Ctrl+C to stop the server
echo ==================================
echo.

REM Start Python HTTP server
python -m http.server %PORT% 2>nul
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH!
    echo Please install Python 3 from https://www.python.org/
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)
