@echo off

@REM keep Microsoft.WindowsStore && Microsoft.MicrosoftEdge
set list=Microsoft.549981C3F5F10 Microsoft.WindowsAlarms Microsoft.MicrosoftStickyNotes Microsoft.SkypeApp Microsoft.WindowsFeedbackHub Microsoft.MicrosoftOfficeHub Microsoft.Office.OneNote Microsoft.Microsoft3DViewer Microsoft.XboxGameCallableUI Microsoft.XboxGameOverlay Microsoft.Xbox.TCUI  Microsoft.XboxApp Microsoft.XboxIdentityProvider Microsoft.XboxSpeechToTextOverlay Microsoft.XboxGamingOverlay Microsoft.GamingServices microsoft.windowscommunicationsapps Microsoft.BingWeather Microsoft.ZuneVideo Microsoft.ZuneMusic Microsoft.People Microsoft.Windows.PeopleExperienceHost Microsoft.YourPhone Microsoft.MicrosoftSolitaireCollection Microsoft.GetHelp  Microsoft.WindowsMaps Microsoft.WindowsSoundRecorder

for %%a in (%list%) do (
    echo %%a
    PowerShell -Command "& {Get-AppxPackage -alluser %%a | Remove-AppxPackage}"
)