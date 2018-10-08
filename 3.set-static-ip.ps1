Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet 2'

# PrefixLength of 24 equals a subnet mask of 255.255.255.0
New-NetIPAddress –InterfaceAlias 'Ethernet 2' –IPAddress '192.168.50.5' –PrefixLength 24