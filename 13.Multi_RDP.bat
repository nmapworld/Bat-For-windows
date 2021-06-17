@echo off
title Multi_RDP
echo "list.txt set your IP Address"
set /p user="Input you Username: "
set /p passwd="Input you password: "

echo  "------------Check history----------"
reg query "HKCU\software\microsoft\terminal server client\Default"
pause
echo "---------------Add Cert-------------"

for /f %%i in (list.txt)do (
	echo %%i
	cmdkey /add:%%i /user:%user% /pass:%passwd%
	)

echo "---------------Start Remote-------------"

for /f %%i in (list.txt)do (
	echo %%i
	start mstsc /V:%%i
	)
echo Finish
pause
echo "---------------Remove Cert-------------"
for /f %%i in (list.txt)do (
	echo %%i
	cmdkey /delete:%%i
	)
pause
echo Clear history in reg
REG DELETE "HKCU\software\microsoft\terminal server client\Default" /f


