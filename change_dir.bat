@echo off
set last_path=%cd%
set path=\tmp
mkdir %path%
cd %path%
dir /a
time \t >time.txt
dir /a
pause
del time.txt
echo %cd%
cd %last_path%
echo %cd%
pause