@echo off
set PortNumber=3389

title Change RDP_Port %PortNumber%
pause
@REM Start RDP
REG add HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server /v fDenyTSConnections /t REG_DWORD /d 0 /f
@REM Stop RDP
::REG add HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server /v fDenyTSConnections /t REG_DWORD /d 1 /f
@REM Change TCPPort for RDP
reg add HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server\Wds\rdpwd\Tds\tcp /v PortNumber /t REG_DWORD /d %PortNumber% /f
@REM Change UDPPort for RDP
reg add HKLM\SYSTEM\CurrentControlSet\Control\Terminal" "Server\WinStations\RDP-Tcp /v PortNumber /t REG_DWORD /d %PortNumber% /f
@REM check RDPport
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /V PortNumber
@REM Permit RPD from Advfirewall
netsh advfirewall firewall add rule  name="RDP_TCP" dir=in protocol=tcp localport=%PortNumber% action=allow
netsh advfirewall firewall add rule  name="UDP_UDP" dir=in protocol=udp localport=%PortNumber% action=allow
@REM Restart Service
net stop TermService /y
net start TermService
choice /t 5 /d y /n >nul
netstat -ano |findstr %PortNumber%
pause