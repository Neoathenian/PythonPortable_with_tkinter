# PythonPortable

This repository provides a Portable Python environment that supports running any Python app with Tkinter, directly via a `Run.bat` script. Unlike many Portable Python versions, this one includes Tkinter support, enabling GUI-based applications out of the box.

## Setup

1. **Copy Files**: Place the `PythonPortable` folder, `Run.bat` and `Install_additional_modules.bat` into the same directory as the script you wish to run.

2. **Install Additional Modules**: Run `Install_additional_modules.bat` to install any required Python modules. You can edit this script to specify additional `pip install` commands as needed.

3. **Edit `Run.bat`**: Open `Run.bat` and set `SCRIPT_NAME` to the name of the script you want to execute.

4. **Run Your Script**: Double-click `Run.bat` to launch your specified Python script.

## Creating PythonPortable with Tkinter Support

To create a PythonPortable environment from scratch, follow these steps:

1. **Run Installation**: Execute `Installation.bat`, which will download and set up a Portable Python environment.

2. **Enable Tkinter Support**:
   - Download the same Python version as the embedded distribution, and install it locally.
   - Copy the following files from your regular Python installation to the appropriate folders in `PythonPortable`:

     - **`tcl` folder** → `PythonPortable\` (root folder)
     - **`tkinter` folder** (from `Lib`) → `PythonPortable\Lib\` or `PythonPortable\`
     - DLL files: **`_tkinter.pyd`, `tcl86t.dll`, `tk86t.dll`, `zlib1.dll`** (for Python ≥ 3.12) → `PythonPortable\DLLs\` or **`PythonPortable\`** (this one in my case)

For more details, refer to [this Stack Overflow thread](https://stackoverflow.com/questions/37710205/python-embeddable-zip-install-tkinter).
