@echo off
echo "Will locked ALL Driver for Bitlocker"
pause
for %%i in (A,B,C,D,E,F,G,H,I,J,K,L,M,N) do (manage-bde -lock %%i:)
::pause