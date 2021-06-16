@echo off
echo "will Clean Allstartup"
pause

whoami /user /fo list |findstr SID >%tmp%/n.txt
echo clear user_Startup
for /f "tokens=2" %i in  (%tmp%/n.txt)  do REG DELETE HKU\%i\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
del /S /Q /F %APPDATA%\Microsoft\Windows\Start" "Menu\Programs\Startup\*

echo clear System_Startup
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f
del /S /Q /F %ALLUSERSPROFILE%\Microsoft\Windows\Start" "Menu\Programs\StartUp\*
pause
