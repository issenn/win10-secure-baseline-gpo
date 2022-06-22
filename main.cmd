@echo off
setlocal


@REM net stop bits
@REM net stop wuauserv

@REM Control Panel Registry

@REM Prevent device metadata retrieval from the Internet / Do not automatically download manufacturers’ apps and custom icons available for your devices
@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v "PreventDeviceMetadataFromNetwork" /d 1 /t REG_DWORD /f
@REM sc config DsmSvc start= disabled

@REM Do you want Windows to download driver Software / 0 - Never / 1 - Allways / 2 - Install driver Software, if it is not found on my computer
@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /d 0 /t REG_DWORD /f

@REM Specify search order for device driver source locations
@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "DontSearchWindowsUpdate" /d 1 /t REG_DWORD /f
@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "DriverUpdateWizardWuSearchEnabled" /d 0 /t REG_DWORD /f

@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /d 1 /t REG_DWORD /f
@REM Reg Delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v "AUOptions" /f


@REM Group Policy Registry

@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v "SearchOrderConfig" /d 0 /t REG_DWORD /f

@REM 1 - Disable driver updates in Windows Update
@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /d 1 /t REG_DWORD /f

@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /d 1 /t REG_DWORD /f
@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /d 1 /t REG_DWORD /f
@REM Reg Delete "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /f

@REM Reg Add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /d 1 t REG_DWORD /f

REGEDIT /S "%~dp0main.reg"

call install.cmd /y

@REM rd /s /q "%SystemRoot%\SoftwareDistribution"
@REM net start bits
@REM net start wuauserv
@REM wuauclt /resetauthorization /detectnow

gpupdate /force

Pause > nul
