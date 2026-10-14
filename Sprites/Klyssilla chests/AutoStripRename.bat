@echo off
setlocal

if "%~1"=="" (
    echo Drag a folder onto this BAT file.
    pause
    exit /b
)

set "SOURCE=%~f1"
set "OUT=%~dp1%~nx1_StripFixed"
set "PSFILE=%TEMP%\AutoStripRename.ps1"

if exist "%OUT%" (
    echo Output folder already exists:
    echo "%OUT%"
    pause
    exit /b
)

> "%PSFILE%" echo param([string]$Source, [string]$Out)
>>"%PSFILE%" echo $ErrorActionPreference = 'Stop'
>>"%PSFILE%" echo Copy-Item -LiteralPath $Source -Destination $Out -Recurse
>>"%PSFILE%" echo Add-Type -AssemblyName System.Drawing
>>"%PSFILE%" echo $files = @(Get-ChildItem -LiteralPath $Out -Recurse -File ^| Where-Object { $_.Extension -match '^\.(png^|jpg^|jpeg^|bmp^|gif^|tif^|tiff^|webp)$' })
>>"%PSFILE%" echo Write-Host "Images found: $($files.Count)"
>>"%PSFILE%" echo $renamed = 0
>>"%PSFILE%" echo foreach ($file in $files) {
>>"%PSFILE%" echo   $img = $null
>>"%PSFILE%" echo   try {
>>"%PSFILE%" echo     $img = [System.Drawing.Image]::FromFile($file.FullName)
>>"%PSFILE%" echo     $ratio = [math]::Round($img.Width / $img.Height)
>>"%PSFILE%" echo     $img.Dispose()
>>"%PSFILE%" echo     $img = $null
>>"%PSFILE%" echo     $base = $file.BaseName -replace '_strip\d+$',''
>>"%PSFILE%" echo     $newName = $base + '_strip' + $ratio + $file.Extension
>>"%PSFILE%" echo     if ($file.Name -ne $newName) {
>>"%PSFILE%" echo       Rename-Item -LiteralPath $file.FullName -NewName $newName
>>"%PSFILE%" echo       Write-Host ($file.Name + ' -^> ' + $newName)
>>"%PSFILE%" echo       $renamed++
>>"%PSFILE%" echo     }
>>"%PSFILE%" echo   } catch {
>>"%PSFILE%" echo     Write-Host ('FAILED: ' + $file.FullName + ' : ' + $_.Exception.Message)
>>"%PSFILE%" echo   } finally {
>>"%PSFILE%" echo     if ($img) { $img.Dispose() }
>>"%PSFILE%" echo   }
>>"%PSFILE%" echo }
>>"%PSFILE%" echo Write-Host "Renamed: $renamed"

powershell -NoProfile -ExecutionPolicy Bypass -File "%PSFILE%" -Source "%SOURCE%" -Out "%OUT%"
del "%PSFILE%"

echo.
echo Output: "%OUT%"
pause
