@echo off

REM Display help text for script before running
REM 1: display help text for script
REM 0: do not display help text
set displayHelp=1

REM Pause at the end of the script
REM 1: Pause
REM 0: Does not pause
set pauseAtEnd=0

REM Requires administrative privileges:
REM 1: requires
REM 0: Does not require
set RequiresAdmin=0

REM Script name to execute
REM Leave empty to use the basename of current cmd file
set scriptName=

REM Subdirectory containing script to execute
REM Leave empty to use current directory
set scriptSubdir=

REM Run script from Script Dir instead of CWD
REM 1: Run from Script Dir
REM 0: Run from CWD
set runFromScriptDir=0

REM Script type.
REM Default: PS1
REM PS1 : PowerShell
REM PY : Python
REM SH : Bash (not implemented)
REM BAT : Batch (not implemented)


set scriptType=PS1



if "%scriptSubdir%"=="" (
	set "scriptSubdir=.\"
) 

set "scriptDir=%~dp0%scriptSubdir%"


if "%scriptName%"=="" (
	if "%scriptType%"=="PS1" (
		set "scriptName=%~n0.ps1"
	) else if "%scriptType%"=="PY" (
		set "scriptName=%~n0.py"
	) else if "%scriptType%"=="BAT" (
		set "scriptName=%~n0.bat"
	) else (
		set "scriptName=%~n0"
	)
) 
set "scriptFullName=%scriptDir%%scriptName%"



if %runFromScriptDir%==1 (
   cd "%scriptDir%"
)


if %displayHelp%==1 (
	if "%scriptType%"=="PS1" (
		echo SYNOPSIS:
		powershell -ExecutionPolicy Bypass -Command "(Get-Help \"%scriptFullName%\").synopsis"
		echo DESCRIPTION:
		powershell -ExecutionPolicy Bypass -Command "(Get-Help \"%scriptFullName%\").description"
	)
	
)



REM Check for administrative privileges
if "%RequiresAdmin%"=="1" (
	net session >nul 2>&1
	if %errorlevel% neq 0 (
		echo This script requires administrative privileges.
		pause
		exit /b
	)
)


if "%scriptType%"=="PS1" (
	powershell -ExecutionPolicy Bypass -File "%scriptFullName%" %*
)
if "%scriptType%"=="PY" (
	python "%scriptFullName%" %*
)




if "%pauseAtEnd%"=="1" (
    pause
)

