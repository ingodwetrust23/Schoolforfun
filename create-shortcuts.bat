@echo off
echo ========================================
echo    Creating Desktop Shortcuts
echo ========================================
echo.
echo This will create shortcuts on your desktop for easy access.
echo.

REM Create shortcut for starting the app
echo Creating shortcut for starting the application...
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\Schoolforfun - Start App.lnk'); $Shortcut.TargetPath = 'D:\Schoolforfun\start-app.bat'; $Shortcut.WorkingDirectory = 'D:\Schoolforfun'; $Shortcut.Description = 'Start Schoolforfun Application'; $Shortcut.Save()"

REM Create shortcut for building the app
echo Creating shortcut for building the application...
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\Schoolforfun - Build App.lnk'); $Shortcut.TargetPath = 'D:\Schoolforfun\build-app.bat'; $Shortcut.WorkingDirectory = 'D:\Schoolforfun'; $Shortcut.Description = 'Build Schoolforfun for Production'; $Shortcut.Save()"

REM Create shortcut for running tests
echo Creating shortcut for running tests...
powershell -Command "$WshShell = New-Object -comObject WScript.Shell; $Shortcut = $WshShell.CreateShortcut('%USERPROFILE%\Desktop\Schoolforfun - Run Tests.lnk'); $Shortcut.TargetPath = 'D:\Schoolforfun\test-app.bat'; $Shortcut.WorkingDirectory = 'D:\Schoolforfun'; $Shortcut.Description = 'Run Schoolforfun Tests'; $Shortcut.Save()"

echo.
echo ========================================
echo Shortcuts created successfully!
echo Check your desktop for the new shortcuts:
echo.
echo - Schoolforfun - Start App
echo - Schoolforfun - Build App  
echo - Schoolforfun - Run Tests
echo ========================================
echo.
pause
