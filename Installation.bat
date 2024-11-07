@echo off
setlocal

:: Variables for setup
set PYTHON_VERSION=3.11.8
set PYTHON_URL=https://www.python.org/ftp/python/%PYTHON_VERSION%/python-%PYTHON_VERSION%-embed-amd64.zip
set GET_PIP_URL=https://bootstrap.pypa.io/get-pip.py
set ZIP_FILE=%~dp0python.zip
set PIP_SCRIPT=%~dp0get-pip.py
set EXTRACT_DIR=%~dp0PythonPortable
set REQUIREMENTS_FILE=%~dp0requirements.txt
set SCRIPT_NAME=server.py  
:: Ensure this is just the file name if in the same directory

SET PATH=%PATH%;%~dp0PythonPortable\Scripts


:: Download Python embeddable zip using PowerShell
echo Downloading Python...
powershell -Command "Invoke-WebRequest -Uri '%PYTHON_URL%' -OutFile '%ZIP_FILE%'"

:: Extract the zip file using PowerShell
echo Extracting Python...
powershell -Command "Expand-Archive -LiteralPath '%ZIP_FILE%' -DestinationPath '%EXTRACT_DIR%' -Force"

:: Download get-pip.py using PowerShell
echo Downloading get-pip.py...
powershell -Command "Invoke-WebRequest -Uri '%GET_PIP_URL%' -OutFile '%PIP_SCRIPT%'"

:: Install pip
echo Installing pip...
"%EXTRACT_DIR%\python.exe" "%PIP_SCRIPT%"


:: Modify the _pth file to recognize site-packages
echo Adding site-packages to Python path...
:: Dynamically construct _pth file name from version
for /f "tokens=1,2 delims=." %%a in ("%PYTHON_VERSION%") do (
 set PTH_FILE_NAME=python%%a%%b._pth
)
echo ./Lib/site-packages>>"%EXTRACT_DIR%\%PTH_FILE_NAME%"

:: Temporarily add Python Scripts directory to PATH within the script
set PATH=%EXTRACT_DIR%\Scripts;%PATH%

:: Install packages from requirements.txt
:: Adjust the pip call to use the python executable and the -m option to ensure compatibility
echo Installing dependencies from requirements.txt...
"%EXTRACT_DIR%\python.exe" -m pip install -r "%REQUIREMENTS_FILE%"

:: Run your Python script
echo Running Python script...
::"%EXTRACT_DIR%\python.exe" "%~dp0%SCRIPT_NAME%"


:: Cleanup
echo Cleaning up...
del "%ZIP_FILE%"
del "%PIP_SCRIPT%"

echo.
echo Script execution finished. Press any key to exit.
pause >nul

endlocal
