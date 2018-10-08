# run these commands from elevated PowerShell
Start-Process PowerShell -Verb RunAs

docker image pull mcr.microsoft.com/windows/servercore:1809
docker image pull mcr.microsoft.com/windows/nanoserver:1809

# $tag = '10.0.14393.1198'

# docker pull "microsoft/windowsservercore:$tag"
# docker pull "microsoft/nanoserver:$tag"

# docker tag "microsoft/windowsservercore:$tag" microsoft/windowsservercore:latest
# docker tag "microsoft/nanoserver:$tag" microsoft/nanoserver:latest