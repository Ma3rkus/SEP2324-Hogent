<#
Set the IP address of the Windows client quickly when using the virtual intnet network
#>

# Define the network settings here
$ipAddress = '192.168.102.136'
$prefixLength = 27
$gateway = '192.168.102.129'

# Get the current IP address
$currentIpAddress = (Get-NetIPAddress -InterfaceAlias 'Ethernet').IPAddress

# Check if the IP address is $ipAddress
if ($currentIpAddress -ne $ipAddress) {
    # Set the IP-address
    Set-NetIPInterface -InterfaceAlias 'Ethernet' -Dhcp Disabled
    New-NetIPAddress -IPAddress $ipAddress -PrefixLength $prefixLength -DefaultGateway $gateway -InterfaceAlias 'Ethernet'

    # Set the DNS server
    Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses ('192.168.102.130')
}