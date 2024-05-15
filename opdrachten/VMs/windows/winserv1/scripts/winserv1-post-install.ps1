<#
Post-installation script for winserv1
#>

# Set the execution policy to unrestricted for the current user and local machine
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force
Start-Transcript -Path C:\log.txt -Append

# Define the network settings here
$ipAddress = '192.168.102.130'
$ipv6Address = 'fd69:6f00:73d8:2c42::2'
$prefixLength = 27
$prefixLengthv6 = 64
$gateway = '192.168.102.129'
$gatewayv6 = 'fd69:6f00:73d8:2c42::1'

function ipAdding () {
    param (
        $family,
        $ip,
        $prefix, 
        $gate
    )
    $currentIpAddress = (Get-NetIPAddress -InterfaceAlias 'Ethernet' -AddressFamily $family).IPAddress

    # Check if the IPv4 address is $ipAddress
    if ($currentIpAddress -ne $ipAddress) {
        # Set the IP-address
        Set-NetIPInterface -AddressFamily $family -InterfaceAlias 'Ethernet' -Dhcp Disabled
        New-NetIPAddress -AddressFamily $family -IPAddress $ip -PrefixLength $prefix -DefaultGateway $gate -InterfaceAlias 'Ethernet'

    }
}

ipAdding -family IPv4 -ip $ipAddress -prefix $prefixLength -gate $gateway
ipAdding -family IPv6 -ip $ipv6Address -prefix $prefixLengthv6 -gate $gatewayv6
# Set the DNS server
Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses ('192.168.102.130')

# This should be the last command in the script
# Unregister the post-installation script
Unregister-ScheduledTask -TaskName "post-install.ps1" -Confirm:$false
Set-WinUserLanguageList -LanguageList 'nl-be' -Confirm:$false -Force

#Deploy server
& 'Z:\winserv1-deployAll.ps1'