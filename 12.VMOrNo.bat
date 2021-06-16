@echo off
wmic diskdrive list brief |findstr VMware|find /v /c "">%temp%\Vitual.txt
for /f %%i in (%temp%\Vitual.txt) do set a=%%i
echo VM Disk Num is:%a%
if %a% equ 0 (echo "Physical Machine") else (echo "Virtual Machine")
pause