@echo off
echo "will Disable Defender"
pause
@REM  Disable Defender
@REM  Fix Windows 10 20H2(19042)
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