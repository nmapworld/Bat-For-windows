@echo off
set filename=software.txt

echo "Will Creat：%userprofile%\desktop\%filename%"
pause



::Reg Read
echo 64Bits:>%userprofile%\desktop\%filename%
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall /f DisplayName /t REG_SZ /s |findstr REG_SZ>>%userprofile%\desktop\%filename%
echo 32Bits:>>%userprofile%\desktop\%filename%
reg query HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall /f DisplayName /t REG_SZ /s |findstr REG_SZ>>%userprofile%\desktop\%filename%

::Powershell
::PowerShell -Command "& {Get-StartApps |format-list}">>%userprofile%\desktop\%filename%