@echo off
setlocal

if "%~1"=="" (
    echo Drag a folder onto this BAT file.
    pause
    exit /b
)

set "ROOT=%~1"

for /r "%ROOT%" %%F in (*) do (
    if exist "%%F" if not exist "%%F\" (
        echo "%%~nF" | findstr /i /e /c:"_plus" >nul
        if errorlevel 1 (
            ren "%%F" "%%~nF_plus%%~xF"
            echo Renamed: %%~nxF
        )
    )
)

echo.
echo Finished!
pause