@echo off
@REM win10 Init
echo "Win10 Init"
title "Win10 Init"
pause

@REM Active local account for Administrator
net user administrator /active:yes

@REM STOP Default Share
net share C$ /delete
net share IPC$ /delete
net share ADMIN$ /delete

@REM Set Interface dhcp ip and static dns
@REM netsh interface ip set address name="Ethernet0" source=dhcp
::netsh interface ip set dnsserver name="Ethernet0" static 8.8.8.8 primary
@REM ipconfig /release
@REM ipconfig /renew

@REM Set Firewall
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule  name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound
netsh advfirewall firewall add rule  name="tcp" dir=in protocol=tcp localport=3389 action=allow
netsh advfirewall firewall add rule  name="udp" dir=in protocol=udp localport=3389 action=allow


@REM Uninstall Default App in Windows 10
set list=549981C3F5F10 WindowsAlarms MicrosoftStickyNotes SkypeApp WindowsFeedbackHub MicrosoftOfficeHub Office.OneNote Microsoft3DViewer XboxGameOverlay Xbox.TCUI  XboxApp XboxIdentityProvider XboxSpeechToTextOverlay XboxGamingOverlay GamingServices windowscommunicationsapps BingWeather ZuneVideo ZuneMusic People Windows.PeopleExperienceHost YourPhone MicrosoftSolitaireCollection GetHelp  WindowsMaps WindowsSoundRecorder

for %%a in (%list%) do (
    echo %%a
    PowerShell -Command "& {Get-AppxPackage -alluser Microsoft.%%a | Remove-AppxPackage}"
)

@REM Disable Services
set list=AppReadiness BITS LanmanServer SSDPSRV

for %%a in (%list%) do (
    echo %%a
    sc stop %%a
    sc config %%a start=disabled
)

@REM Clear Startup
wmic startup get location>%temp%/Startup.txt
type %temp%/Startup.txt
for /f %%i in  (%temp%/Startup.txt) do REG DELETE %%i /f

@REM Disable Defender
reg add HKLM\SOFTWARE\Microsoft\Windows" "Defender /v DisableAntiVirus /t REG_DWORD /d 1 /f
