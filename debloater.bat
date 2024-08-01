@echo off
NET SESSION >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit /b
)

echo ============================================
echo Removing Default Windows 10/11 Apps
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage"
echo Removed Photos app
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.WindowsCalculator* | Remove-AppxPackage"
echo Removed Calculator app
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage"
echo Removed Microsoft Store
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage"
echo Removed OneNote
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
echo Removed Groove Music
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"
echo Removed Movies & TV
echo ============================================

powershell -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"
echo Removed Xbox apps
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage"
echo Removed Your Phone app
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
echo Removed Sticky Notes
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage"
echo Removed Skype
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
echo Removed Solitaire Collection
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
echo Removed Weather
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
echo Removed Paint
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
echo Removed 3D Builder
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.3DViewer* | Remove-AppxPackage"
echo Removed 3D Viewer
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
echo Removed Get Help
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
echo Removed Get Started
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
echo Removed Messaging
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.OfficeHub* | Remove-AppxPackage"
echo Removed Office Hub
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
echo Removed People
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"
echo Removed Snip & Sketch
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.StorePurchaseApp* | Remove-AppxPackage"
echo Removed Store Purchase App
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.Todo* | Remove-AppxPackage"
echo Removed To-Do
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.Wallet* | Remove-AppxPackage"
echo Removed Wallet
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage"
echo Removed Alarms & Clock
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
echo Removed Feedback Hub
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
echo Removed Maps
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
echo Removed Sound Recorder
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage"
echo Removed Xbox Game Overlay
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.XboxGamingOverlay* | Remove-AppxPackage"
echo Removed Xbox Gaming Overlay
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage"
echo Removed Xbox Identity Provider
echo ============================================

powershell -Command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage"
echo Removed Xbox Speech to Text Overlay
echo ============================================

taskkill /f /im OneDrive.exe
if exist "%SystemRoot%\SysWOW64\OneDriveSetup.exe" (
    %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
) else (
    %SystemRoot%\System32\OneDriveSetup.exe /uninstall
)
echo Removed OneDrive
echo ============================================

powershell -Command "Get-AppxPackage *MicrosoftEdge* | Remove-AppxPackage"
echo Removed Edge
echo ============================================

powershell -Command "Get-AppxPackage *windowsweb* | Remove-AppxPackage"
echo Removed Widgets
echo ============================================

powershell -Command "Remove-Item -Path \"HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Copilot\" -Recurse"
echo Removed Windows Copilot
echo ============================================

powershell -Command "Set-Service -Name \"DiagTrack\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"dmwappushservice\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"DPS\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"Wsearch\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"wercplsupport\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"trkwks\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"HomeGroupListener\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"HomeGroupProvider\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"WMPNetworkSvc\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"RemoteRegistry\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"RemoteAccess\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"RemoteDesktopServices\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"NetTcpPortSharing\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"Fax\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"PSched\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"SharedAccess\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"W32Time\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"Spooler\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"TimeBrokerSvc\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"WalletService\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"wisvc\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"RetailDemo\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"SmsRouter\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"SEMgrSvc\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"lfsvc\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"PimIndexMaintenanceSvc\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"PeopleExperienceHost\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"PrintNotify\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"LicenseManager\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"NaturalAuthentication\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"SharedRealitySvc\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"TokenBroker\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"WpnService\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"CDPSvc\" -StartupType Disabled"
powershell -Command "Set-Service -Name \"WaaSMedicSvc\" -StartupType Disabled"
echo Disabled non-essential services
echo ============================================

powershell -Command "reg delete \"HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\" /v HideSCAMeetNow /f"
echo Removed "Meet Now" icon from taskbar
echo ============================================

schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "\Microsoft\Windows\Application Experience\AitAgent" /Disable
schtasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "\Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\ActivateWindowsSearch" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\ConfigureInternetTimeService" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\DispatchRecoveryTasks" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\ehDRMInit" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\InstallPlayReady" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\mcupdate" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\MediaCenterRecoveryTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\ObjectStoreRecoveryTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\OCURActivate" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\OCURDiscovery" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\PBDADiscovery" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\PBDADiscoveryW1" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\PBDADiscoveryW2" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\PvrRecoveryTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\PvrScheduleTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\RegisterSearch" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\ReindexSearchRoot" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\SqlLiteRecoveryTask" /Disable
schtasks /Change /TN "\Microsoft\Windows\Media Center\UpdateRecordPath" /Disable

echo Downloading Google Chrome...
bitsadmin /transfer "ChromeDL" https://dl.google.com/chrome/install/latest/chrome_installer.exe "%temp%\chrome_installer.exe"
echo Installing Google Chrome...
start /wait "" "%temp%\chrome_installer.exe" /silent /install
echo Cleaning up...
del "%temp%\chrome_installer.exe"
echo Installed Google Chrome
echo ============================================

echo Finished debloating.
pause
