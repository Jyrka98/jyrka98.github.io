taskkill /F /IM Origin.exe
taskkill /F /IM OriginClientService.exe
taskkill /F /IM OriginWebHelperService.exe
pushd "C:\ProgramData\Origin\" || exit /B 1
for /D %%D in ("*") do (
if /I not "%%~nxD"=="LocalContent" rd /S /Q "%%~D"
)
for %%F in ("*") do (
del "%%~F"
)
popd
rmdir /s /q "%appdata%\Origin"
rmdir /s /q "%localappdata%\Origin"
shutdown /r /t 0