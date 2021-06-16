@echo off
echo "-------------------------------Win10 Init batch---------------------------"
echo "|                                                                        |"
echo "|  Will clear shares & Firewall & Apps & Serivces & Startup & Defender   |"
echo "|                                                                        |"
echo "-------------------------------Win10 Init batch----------------------------"
echo .
color 02
title "Win10 Init"
pause

echo "------------------------Active local account for Administrator--------------------------"
net user administrator /active:yes

echo "----------------------------Remove Shares Default----------------------------------------"
net share C$ /delete
net share IPC$ /delete
net share ADMIN$ /delete

echo "--------------------------------Set DHCP with DNS----------------------------------------"
netsh interface ip set address name="Ethernet0" source=dhcp
netsh interface ip set dnsserver name="Ethernet0" static 8.8.8.8 primary
ipconfig /release
ipconfig /renew


echo "----------------------------------Clear Firewall Rules------------------------------------"
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule  name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound
netsh advfirewall firewall add rule  name="tcp" dir=in protocol=tcp localport=3389 action=allow
netsh advfirewall firewall add rule  name="udp" dir=in protocol=udp localport=3389 action=allow

echo "-------------------------------Uninstall Default Apps--------------------------------------"
set list=549981C3F5F10 WindowsAlarms MicrosoftStickyNotes SkypeApp WindowsFeedbackHub MicrosoftOfficeHub Office.OneNote Microsoft3DViewer XboxGameOverlay Xbox.TCUI  XboxApp XboxIdentityProvider XboxSpeechToTextOverlay XboxGamingOverlay GamingServices windowscommunicationsapps BingWeather ZuneVideo ZuneMusic People Windows.PeopleExperienceHost YourPhone MicrosoftSolitaireCollection GetHelp  WindowsMaps WindowsSoundRecorder

for %%a in (%list%) do (
    echo %%a
    PowerShell -Command "& {Get-AppxPackage -alluser Microsoft.%%a | Remove-AppxPackage}"
)

echo "------------------------------- Disable&Stop Services--------------------------------------"
set list=AppReadiness BITS LanmanServer SSDPSRV iphlpsvc W32Time wuauserv WinHttpAutoProxySvc Spooler MapsBroker WSearch

for %%a in (%list%) do (
    echo %%a
    sc stop %%a
    sc config %%a start=disabled
)

echo "---------------------------------- Clear Startup-------------------------------------------"
whoami /user /fo list |findstr SID >%tmp%/n.txt
for /f "tokens=2" %%i in  (%tmp%/n.txt)  do REG DELETE HKU\%%i\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f

del /S /Q /F %ALLUSERSPROFILE%\Microsoft\Windows\Start" "Menu\Programs\StartUp\*
del /S /Q /F %APPDATA%\Microsoft\Windows\Start" "Menu\Programs\Startup\*

echo "--------------------------------- Disable Windows Defender----------------------------------"
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "Defender /v DisableAntiVirus /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows" "Defender /v DisableAntiSpyware /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows" "Defender /v ServiceKeepAlive /t REG_DWORD /d  0 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows" "Defender /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows" "Defender /v DisableAntiSpyware /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows" "Defender /v DisableAntiVirus /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows" "Defender\Scan /v DisableReparsePointScanning /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows" "Defender\Real-Time" "Protection /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows" "Defender\Real-Time" "Protection /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows" "Defender\Real-Time" "Protection /v DisableIOAVProtection /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\DeviceHealthAttestationService /v EnableDeviceHealthAttestationService /t REG_DWORD /d  0 /f
REG ADD HKLM\System\CurrentControlSet\Control\Storage\EnabledDenyGP /v DenyAllGPState /t REG_DWORD /d 1 /f
REG ADD HKLM\System\currentcontrolset\services\SecurityHealthService /v start /t REG_DWORD /d 4 /f
REG DELETE HKLM\software\microsoft\windows\currentversion\run /v SecurityHealth /f
pause
