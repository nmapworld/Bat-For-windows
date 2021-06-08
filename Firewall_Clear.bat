netsh advfirewall set allprofiles state on
netsh  advfirewall firewall delete rule  name=all
netsh advfirewall set allprofiles firewallpolicy blockinbound,allowoutbound
netsh advfirewall firewall add rule  name="tcp" dir=in protocol=tcp localport=7000 action=allow
netsh advfirewall firewall add rule  name="udp" dir=in protocol=udp localport=7001 action=allow
::time /t >>%userprofile%\Desktop\1.log