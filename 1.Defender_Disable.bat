rem 关闭Windows Definder
reg add HKLM\SOFTWARE\Microsoft\Windows" "Defender /v DisableAntiVirus /t REG_DWORD /d 1 /f
rem 开启Windows Definder
::reg add HKLM\SOFTWARE\Microsoft\Windows" "Defender /v DisableAntiVirus /t REG_DWORD /d 0 /f