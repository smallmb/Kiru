@echo off
setlocal
cd /d "%~dp0"
powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%~dp0start-dev.ps1" %*
set "FLUTTER_EXIT_CODE=%ERRORLEVEL%"
if not "%FLUTTER_EXIT_CODE%"=="0" pause
exit /b %FLUTTER_EXIT_CODE%
