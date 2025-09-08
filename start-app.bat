@echo off
echo ========================================
echo    Schoolforfun - School Management System
echo ========================================
echo.
echo Starting the application...
echo Please wait while we set up everything...
echo.

REM Navigate to the project directory
cd /d "D:\Schoolforfun"

REM Check if node_modules exists, if not install dependencies
if not exist "node_modules" (
    echo Installing dependencies for the first time...
    echo This may take a few minutes...
    npm install
    echo.
)

REM Start the development server
echo Starting the development server...
echo The application will open automatically in your browser.
echo.
echo To stop the server, press Ctrl+C in this window.
echo.

npm start

REM Keep the window open if there's an error
if errorlevel 1 (
    echo.
    echo ========================================
    echo There was an error starting the application.
    echo Please check the error messages above.
    echo ========================================
    echo.
    pause
)
