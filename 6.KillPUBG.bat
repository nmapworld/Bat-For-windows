taskkill /f /t /im TslGame_ZK.exe
taskkill /f /t /im ucldr_battlegrounds_gl.exe
taskkill /f /t /im zksvc.exe
taskkill /f /t /im vmware*
net stop BEService /y
net start BEService
exit