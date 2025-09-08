@echo off
echo ========================================
echo    Schoolforfun - Building Production Version
echo ========================================
echo.
echo Building the application for production...
echo This will create optimized files in the 'build' folder.
echo.

REM Navigate to the project directory
cd /d "D:\Schoolforfun"

REM Check if node_modules exists, if not install dependencies
if not exist "node_modules" (
    echo Installing dependencies...
    npm install
    echo.
)

REM Build the application
echo Building production version...
npm run build

if errorlevel 1 (
    echo.
    echo ========================================
    echo Build failed! Please check the error messages above.
    echo ========================================
    echo.
    pause
) else (
    echo.
    echo ========================================
    echo Build completed successfully!
    echo Production files are in the 'build' folder.
    echo You can now deploy these files to any web server.
    echo ========================================
    echo.
    
    REM Ask if user wants to open the build folder
    set /p choice="Do you want to open the build folder? (y/n): "
    if /i "%choice%"=="y" (
        explorer build
    )
    
    pause
)
