Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.208 -Force

Install-Module -Name DockerMsftProvider -Repository PSGallery -Force

Install-Package -Name docker -ProviderName DockerMsftProvider -Force -MinimumVersion 18.03

Start-Service docker

Restart-Computer