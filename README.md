
**RunScript**
================

# Overview**
------------

This project is a script execution wrapper that provides a flexible way to run scripts with various options. The script supports different script types, including PowerShell (PS1) and Python (PY).

# Features
------------

- Runs scripts with administrative privileges if required
- Supports different script types (PS1 and PY)
- Provides options for displaying help text and pausing at the end of the script
- Allows for custom script directories and names


# Usage
---------

To use this script, simply save it as a batch file (e.g., `scriptname.cmd`) and modify the variables at the top of the file to suit your needs.
By default, the script will run the script in the current directory, with the same name as the current cmd file.

**Variables**
------------

* `displayHelp`: Set to `1` to display help text before running the script, or `0` to skip.
* `pauseAtEnd`: Set to `1` to pause at the end of the script, or `0` to exit immediately.
* `RequiresAdmin`: Set to `1` to require administrative privileges, or `0` to run without.
* `scriptName`: Set to the name of the script to execute, or leave empty to use the basename of the current cmd file.
* `scriptSubdir`: Set to the subdirectory containing the script to execute, or leave empty to use the current directory.
* `runFromScriptDir`: Set to `1` to run the script from the script directory, or `0` to run from the current working directory.
* `scriptType`: Set to `PS1` for PowerShell (default) or `PY` for Python.

**License**
----------

This project is licensed under the MIT License. See the `LICENSE` file for details.

**Copyright**
------------

Copyright (c) 2025 Gennady Uraltsev

