:: @echo off
setlocal

:: Variables for setup
set EXTRACT_DIR=%~dp0PythonPortable
set SCRIPT_NAME=main.py  

:: Run your Python script
::echo Running Python script...
"%EXTRACT_DIR%\python.exe" "%~dp0%SCRIPT_NAME%"
::--launch_web so that it launches it online




echo.
echo Script execution finished. Press any key to exit.
pause >nul

endlocal
