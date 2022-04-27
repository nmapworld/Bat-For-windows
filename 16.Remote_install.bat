@echo off

echo "remote install software in Windows"

set file="https://www.7-zip.org/a/7z2107-x64.exe"

powershell (new-object Net.WebClient).DownloadFile(%%file)


msiexec /q/i https://www.7-zip.org/a/7z2107-x64.exe


certutil.exe -urlcache -split -f https://www.7-zip.org/a/7z2107-x64.exe