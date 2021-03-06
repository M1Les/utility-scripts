# Set VM Name, Switch Name, and Installation Media Path.
$VMName = 'win-docker-host'
$Switch = 'InternalNet'
$InstallMedia = 'C:\Users\gguskov\Downloads\en_windows_server_2019_x64_dvd_3c2cf1202.iso'

# Create New Virtual Machine
New-VM -Name $VMName -MemoryStartupBytes 4GB -Generation 2 -NewVHDPath "C:\virtual machines\$VMName\Virtual Hard Disks\$VMName.vhdx" -NewVHDSizeBytes 100GB -Path "C:\virtual machines\$VMName" -SwitchName $Switch

# Add DVD Drive to Virtual Machine
Add-VMScsiController -VMName $VMName
Add-VMDvdDrive -VMName $VMName -ControllerNumber 1 -ControllerLocation 0 -Path $InstallMedia

# Mount Installation Media
$DVDDrive = Get-VMDvdDrive -VMName $VMName

# Configure Virtual Machine to Boot from DVD
Set-VMFirmware -VMName $VMName -FirstBootDevice $DVDDrive

