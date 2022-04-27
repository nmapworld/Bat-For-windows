@echo off

echo "请以右键管理员方式运行，并将安装包放置在pkg目录下"
pasue
md pkg
for /r %%i in (pkg\*.exe) do (start /b %%i /S)
if (echo seccuss) else (echo faile)
@REM for /r %%i in (pkg\*.exe) do (start /b %%i /S & start /b %%i /silent)
for /r %%i in (pkg\*.msi) do start /b msiexec /i %%i /qn