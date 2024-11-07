@echo off
setlocal


set PYTHON_VERSION=3.11.8
set EXTRACT_DIR=%~dp0PythonPortable
:: Ensure this is just the file name if in the same directory

SET PATH=%PATH%;%~dp0PythonPortable\Scripts


"%EXTRACT_DIR%\python.exe" -m pip install openpyxl

echo.
echo Script execution finished. Press any key to exit.
pause >nul

endlocal
