@echo off
set GOARCH=386
set GOOS=windows
cls

set /p dir=File Directory: 
if not exist "%dir%" (
    echo Enter a valid directory!
    pause
    exit /b
) else (
    cd /d "%dir%"
)

set /p fn=File Name: 
if not exist "%fn%.go" (
    echo File "%fn%.go" does not exist!
    pause
    exit /b
)

go build -trimpath -ldflags "-s -H windowsgui -w" -gcflags=all="-l -B" "%fn%.go"
if %errorlevel% neq 0 (
    echo Build Failed
    pause
) else (
    echo [*] %fn%.exe was created at %dir%
)
pause