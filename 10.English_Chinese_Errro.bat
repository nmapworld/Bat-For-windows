@REM Fix English for Windows 10,Chinese text Error
pause
reg add HKLM\System\CurrentControlSet\Control\Nls\Language /v Default /t REG_SZ /d 0804 /f