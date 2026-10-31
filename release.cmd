@echo off
setlocal
cd /d "%~dp0"
set "RELEASE_VERSION=%~1"
if not defined RELEASE_VERSION set "RELEASE_VERSION=0.23.1-multilingual.1"
for /f %%i in ('git rev-parse --short HEAD') do set "RELEASE_COMMIT=%%i"
if not defined RELEASE_COMMIT exit /b 1
python tools\package-portable.py --version "%RELEASE_VERSION%" --output "dist\v%RELEASE_VERSION%-%RELEASE_COMMIT%"
exit /b %errorlevel%
