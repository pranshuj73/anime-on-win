@echo off
setlocal

:: Base command
set "command=ani-cli -v"

:: Check if any additional arguments are passed
if "%*"=="" (
    :: No additional arguments, run just the base command
    set "fullCommand=%command%"
) else (
    :: Append additional arguments to the base command
    set "fullCommand=%command% %*"
)

:: Path to Windows Terminal executable
set "wtPath=%LOCALAPPDATA%\Microsoft\WindowsApps\wt.exe"

:: Check if Windows Terminal exists
if exist "%wtPath%" (
    :: Open Windows Terminal with Git Bash profile and execute the command
    start "" "%wtPath%" -p "Git Bash" bash -c "%fullCommand%"
) else (
    echo Windows Terminal not found.
)

endlocal
