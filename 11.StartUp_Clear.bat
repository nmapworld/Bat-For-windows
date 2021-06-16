@echo off
echo "will Clean Allstartup"
pause

whoami /user /fo list |findstr SID >%tmp%\n.txt
echo clear user_Startup
for /f "tokens=2" %%i in  (%tmp%\n.txt)  do REG DELETE HKU\%%i\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
del /S /Q /F %APPDATA%\Microsoft\Windows\Start" "Menu\Programs\Startup\*

echo clear System_Startup
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
del /S /Q /F %ALLUSERSPROFILE%\Microsoft\Windows\Start" "Menu\Programs\StartUp\*
@REM VM tools fix
wmic diskdrive list brief |findstr VMware|find /v /c "">%temp%\Vitual.txt
for /f %%i in (%temp%\Vitual.txt) do set a=%%i
echo VM Disk Num is:%a%
if %a% equ 0 (
	echo "Physical Machine" 
	goto re
) else (echo "Virtual Machine")
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "VMware User Process" /t REG_SZ /d "C:\Program Files\VMware\VMware Tools\vmtoolsd.exe -n vmusr
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v "VMware VM3DService Process" /t REG_SZ /d "C:\Windows\system32\vm3dservice.exe -u"
:re
pause
