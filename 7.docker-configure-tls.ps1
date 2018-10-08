mkdir docker-tls

Invoke-WebRequest "https://github.com/M1Les/utility-scripts/releases/download/0.1/docker-tls.zip" -OutFile docker-tls.zip -UseBasicParsing ; `
	Expand-Archive docker-tls.zip -DestinationPath docker-tls ; `
	#New-Item -ItemType Directory -Path c:\working ; `
	#Copy-Item $Env:Temp\libressl-$Env:VERSION-windows\x64\* $Env:LIBRESSLPATH\. ; `
	#Remove-Item $Env:LIBRESSLPATH\*.pdb ; `

$ips = ((Get-NetIPAddress -AddressFamily IPv4).IPAddress) -Join ','

cd docker-tls
docker build -t docker-tls .

mkdir server
mkdir client\.docker
docker run --rm `
  -e SERVER_NAME=$(hostname) `
  -e IP_ADDRESSES=$ips `
  -e SSL_EXPIRY_DAYS=730 `
  -v "$(pwd)\server:c:\programdata\docker" `
  -v "$(pwd)\client\.docker:c:\users\containeradministrator\.docker" stefanscherer/dockertls-windows
dir server\certs.d
dir server\config
dir client\.docker