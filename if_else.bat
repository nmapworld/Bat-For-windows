@echo off
set input=Null
:re
set /p input=Input "N" to continue:
if %input%==N (
	goto Next
) else (
    echo "%input%" is your input
    goto re
)
:Next
echo "Right!"
WMIC /namespace:\\root\securitycenter2 path antivirusproduct get displayname,pathToSignedReportingExe,productState
echo time \t