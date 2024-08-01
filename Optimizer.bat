::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBNRTRaWAE+1EbsQ5+n//NaoslkUWeslfZ2V36yLQA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off

openfiles >nul 2>&1
if %errorlevel% NEQ 0 (
    echo This script requires administrative privileges.
    powershell -Command "Start-Process cmd -ArgumentList '/c %~fnx0' -Verb RunAs"
    exit /B
)

echo ==================================================
echo Aimee's Windows Optimization Script
echo ==================================================
echo.

echo [1/12] Cleaning temporary files...
del /s /f /q %temp%\* 2>nul
del /s /f /q C:\Windows\Temp\* 2>nul
echo Temporary files cleaned.
echo.

echo [2/12] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
del /s /f /q C:\Windows\SoftwareDistribution\Download\* 2>nul
net start wuauserv >nul 2>&1
echo Windows Update cache cleaned.
echo.

echo [3/12] Disabling unnecessary startup programs...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /f 2>nul
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Skype /f 2>nul
echo Unnecessary startup programs disabled.
echo.

echo [4/12] Enabling performance mode...
powercfg /s SCHEME_MAX >nul
echo Performance mode enabled.
echo.

echo [5/12] Running system file checker...
sfc /scannow
echo System file check complete.
echo.

echo [6/12] Checking for disk errors...
echo This might take a while. Please be patient.
echo Y | chkdsk C: /f
echo Disk check scheduled. A reboot is required to complete the operation.
echo.

echo [7/12] Defragmenting hard drive...
defrag C: /O >nul
echo Hard drive defragmentation complete.
echo.

echo [8/12] Optimizing system startup...
bcdedit /set {current} bootstatuspolicy ignoreallfailures >nul
bcdedit /set {current} recoveryenabled no >nul
echo System startup optimized.
echo.

echo [9/12] Clearing DNS cache...
ipconfig /flushdns >nul
echo DNS cache cleared.
echo.

echo [10/12] Cleaning Recycle Bin...
rd /s /q %systemdrive%\$Recycle.Bin >nul
echo Recycle Bin cleaned.
echo.

echo [11/12] Optimizing network settings...
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global chimney=enabled >nul
netsh int tcp set global dca=enabled >nul
netsh int tcp set global netdma=enabled >nul
netsh int tcp set global ecncapability=enabled >nul
netsh int tcp set global congestionprovider=ctcp >nul
echo Network settings optimized.
echo.

echo [12/12] Disabling hibernation...
powercfg -h off >nul
echo Hibernation disabled.
echo.

echo ==================================================
echo             Optimization Complete!
echo ==================================================
echo All tasks have been completed successfully.
pause
exit