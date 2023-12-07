@ECHO OFF
:: Check for admin rights
NET FILE 1>NUL 2>NUL
if "%ERRORLEVEL%" NEQ "0" (
    ECHO Requesting administrative privileges...
    goto UACPrompt
) else ( goto :main )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
    "%temp%\getadmin.vbs"
    exit /B

:main
:: Your code here
:loop
tasklist /FI "IMAGENAME eq WpcMon.exe" 2>NUL | find /I /N "WpcMon.exe">NUL
IF "%ERRORLEVEL%"=="0" (
    taskkill /IM WpcMon.exe /F
)
timeout /t 2 > nul
goto loop
