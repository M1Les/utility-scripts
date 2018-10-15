# run these commands from elevated PowerShell
Start-Process PowerShell -Verb RunAs

# Query the registry for necessary build information
$winver = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\'
$versiontag = "$($winver.CurrentMajorVersionNumber).$($winver.CurrentMinorVersionNumber).$($winver.CurrentBuildNumber).$($winver.UBR)"


docker image pull mcr.microsoft.com/windows/servercore:$versiontag
docker image pull mcr.microsoft.com/windows/nanoserver:$versiontag

docker image pull microsoft/dotnet:2.1-sdk-nanoserver-1809

docker image pull microsoft/dotnet:2.1-aspnetcore-runtime-nanoserver-1809

# $tag = '10.0.14393.1198'

# docker pull "microsoft/windowsservercore:$tag"
# docker pull "microsoft/nanoserver:$tag"

# docker tag "microsoft/windowsservercore:$tag" microsoft/windowsservercore:latest
# docker tag "microsoft/nanoserver:$tag" microsoft/nanoserver:latest