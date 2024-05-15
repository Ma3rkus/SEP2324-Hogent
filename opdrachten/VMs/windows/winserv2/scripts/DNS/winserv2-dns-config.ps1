<#
.SYNOPSIS
    DNS installation script for winserv1
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.NOTES
    If the Active Directory clone on the secondary server is done correctly this script should and will fail.
    
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.Parameter dnsForwarderAddresses
    Contains an array of the external DNS servers that can be used for external request.

.Parameter networkID
    Contains the ip-address with the corresponding subnetmask.

.Parameter zoneName
    Contains the name of the zone used by the DNS for the internal network.
#>



# Parameters
$dnsForwarderAddresses = "8.8.8.8", "8.8.4.4", "172.22.128.1" #Added the external DNS offered by hogent
$networkID = "192.168.102.0/24" # The CIDR prefix is /27 in real life, but /24 should be used here because limitations of Windows Server and to simplify the reverse lookup zone
$zoneName = "g02-rbmk.internal"

#Functions
function InstallDNS {

    Install-WindowsFeature -Name DNS -IncludeManagementTools

    # Configure DNS forwarder
    Set-DnsServerForwarder -IPAddress $dnsForwarderAddresses

    dnscmd winserv2 /zoneadd $zoneName /primary /file C:\dns-export.dns /load

    # Configure the DNS server to only listen on the specified IP address --- NOT NEEDED BECAUSE ONLY ONE IP ADDRESS IS CONFIGURED
    # Set-DnsClientServerAddress -InterfaceAlias $InterfaceAlias -ServerAddresses @($DnsServerAddress)
}

Start-Transcript -Path C:\log.txt -Append

InstallDNS

# Restart the DNS service
Restart-Service DNS

Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses ('192.168.102.136', '192.168.102.130', 'fd69:6f00:73d8:2c42::8', 'fd69:6f00:73d8:2c42::2')

# Install DHCP

