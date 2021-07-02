@echo off
echo "Will clear all rule in Advfirewall"
rem pause
netsh advfirewall set allprofiles state on
netsh advfirewall firewall delete rule  name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound
netsh advfirewall firewall add rule  name="tcp" dir=in protocol=tcp localport=3389,7890,9050 action=allow
netsh advfirewall firewall add rule  name="udp" dir=in protocol=udp localport=3389 action=allow
netsh interface portproxy add v4tov4 listenport=9050 connectport=9150 connectaddress=127.0.0.1
rem time /t >>%userprofile%\Desktop\1.log