@echo off
time /t>%temp%/time.log
for /f %%i in (%temp%/time.log) do set str=%%i
echo 
echo %str%
msg %username% /time:5 "Now time is:  %str%  "
::exit