netsh wlan show profiles |findstr Profile> %tmp%\wifi1.log
echo >%userprofile%/desktop/wifi_password.txt
for /f "delims=: tokens=2" %%i in (%tmp%\wifi1.log) do netsh wlan show profiles name=%%i key=clear| findstr /i  /C:"SSID name" /C:"Key Content" /C:"---------------------"  1>>%userprofile%/desktop/wifi_password.txt