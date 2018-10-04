powershell

Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.208 -Force

Install-Module -Name DockerMsftProvider -Repository PSGallery -RequiredVersion 1.0.0.4 -Force

Install-Package -Name docker -ProviderName DockerMsftProvider -RequiredVersion 17.06.2-ee-16 -Force

Restart-Computer