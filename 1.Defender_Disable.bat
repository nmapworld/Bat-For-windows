@echo off
echo "will Disable Defender"
pause
rem Stop Disable Defender
reg add HKLM\SOFTWARE\Microsoft\Windows" "Defender /v DisableAntiVirus /t REG_DWORD /d 1 /f
rem Open Disable Defender
::reg add HKLM\SOFTWARE\Microsoft\Windows" "Defender /v DisableAntiVirus /t REG_DWORD /d 0 /f