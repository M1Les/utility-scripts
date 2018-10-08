Invoke-WebRequest "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$Env:VERSION-windows.zip" -OutFile libressl.zip

Invoke-WebRequest "https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-$Env:VERSION-windows.zip" -OutFile libressl.zip -UseBasicParsing ; `
	Expand-Archive libressl.zip -DestinationPath $Env:Temp ; `
	New-Item -ItemType Directory -Path $Env:LIBRESSLPATH ; `
	Copy-Item $Env:Temp\libressl-$Env:VERSION-windows\x64\* $Env:LIBRESSLPATH\. ; `
	Remove-Item $Env:LIBRESSLPATH\*.pdb ; `

mkdir server
mkdir client\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=127.0.0.1,192.168.50.5 `
  -e SSL_EXPIRY_DAYS=730 `
  -v "$(pwd)\server:c:\programdata\docker" `
  -v "$(pwd)\client\.docker:c:\users\containeradministrator\.docker" stefanscherer/dockertls-windows
dir server\certs.d
dir server\config
dir client\.docker