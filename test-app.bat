@echo off
echo ========================================
echo    Schoolforfun - Running Tests
echo ========================================
echo.
echo Running all tests for the application...
echo This will check if everything is working correctly.
echo.

REM Navigate to the project directory
cd /d "D:\Schoolforfun"

REM Check if node_modules exists, if not install dependencies
if not exist "node_modules" (
    echo Installing dependencies...
    npm install
    echo.
)

REM Run tests
echo Running tests...
npm test -- --coverage --watchAll=false

if errorlevel 1 (
    echo.
    echo ========================================
    echo Some tests failed! Please check the results above.
    echo ========================================
    echo.
    pause
) else (
    echo.
    echo ========================================
    echo All tests passed successfully!
    echo Your application is working correctly.
    echo ========================================
    echo.
    pause
)
