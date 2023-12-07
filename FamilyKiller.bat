@ECHO OFF
:loop
tasklist /FI "IMAGENAME eq WpcMon.exe" 2>NUL | find /I /N "WpcMon.exe">NUL
IF "%ERRORLEVEL%"=="0" (
    taskkill /IM WpcMon.exe /F
)
timeout /t 2 > nul
goto loop
