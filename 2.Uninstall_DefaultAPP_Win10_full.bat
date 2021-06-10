@echo off
echo "Will Uninstall Default APP in Windows10"
pause
@REM keep WindowsStore && MicrosoftEdge
set list=549981C3F5F10 WindowsAlarms MicrosoftStickyNotes SkypeApp WindowsFeedbackHub MicrosoftOfficeHub Office.OneNote Microsoft3DViewer XboxGameOverlay Xbox.TCUI  XboxApp XboxIdentityProvider XboxSpeechToTextOverlay XboxGamingOverlay GamingServices windowscommunicationsapps BingWeather ZuneVideo ZuneMusic People Windows.PeopleExperienceHost YourPhone MicrosoftSolitaireCollection GetHelp  WindowsMaps WindowsSoundRecorder

for %%a in (%list%) do (
    echo %%a
    PowerShell -Command "& {Get-AppxPackage -alluser Microsoft.%%a | Remove-AppxPackage}"
)