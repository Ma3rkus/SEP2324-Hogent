<#
.SYNOPSIS
    DHCP installation script for winserv1
.DESCRIPTION
    Installs and configures the DHCP server for the windows server 1(winserv1). The installation will happen for IPv4 and IPv6.
.NOTES
    Att this moment the DHCPv6 server is configure to Stateless. This causes a conflict in the redundant setup.
    TODO -> Fix the redundant setup
.COMPONENT
    Requires an active DNS server

# Function Parameters
## Function InstallDHCPServer
.Parameter dnsName
    Contains the name of the DNS-domain / -server for the configuration of the DHCP server.

.Parameter ipAddress
    Contains the IP-address, on which the DHCP server will be available.

##Function CreateDHCPv4Scope
.Parameter scopeName
    Contains the name to create the scope. With this name we can later search and check the scope.

.Parameter startRange
    Contains the first IPv4 address that the DHCP can distribute.

.Parameter endRange
    Contains the last IPv4 address that the DHCP can distribute.

.Parameter subnetMask
    Contains the subnetmask that defines the subnet in which the IPv4 addresses are situated.

.Parameter scopeId
    Contains the Id that is linked to the scope. With this Id we can later search and check the scope.

.Parameter routerIP
    Contains the IPv4 address of the router / Default Gateway.

#>

function InstallDHCPServer {
    param(
        [string] $dnsName = '',
        [string] $ipAddress = ''
    )

    try {
        # Install the DHCP server role
        Install-WindowsFeature DHCP -IncludeManagementTools

        # Authorize the DHCP server in AD
        Add-DhcpServerInDC -DnsName $dnsName -IPAddress $ipAddress
    }
    catch {
        # Write the error to the console and exit
        Write-Error "$_"
        exit 1
    }

}

function CreateDHCPv4Scope {
    param(
        [string] $scopeName = '',
        [string] $startRange = '',
        [string] $endRange = '',
        [string] $subnetMask = '',
        [string] $scopeId = '',
        [string] $routerIP = ''
    )

    try {
        # Create a new DHCP scope
        Add-DhcpServerv4Scope -Name $scopeName -StartRange $startRange -EndRange $endRange -SubnetMask $subnetMask -State Active

        # Set the router IP
        Set-DhcpServerv4OptionValue -ScopeId $scopeId -OptionId 3 -Value $routerIP
    
    }
    catch {
        # Write the error to the console
        Write-Error "$_"
    }
}

Start-Transcript -Path C:\log.txt -Append
# Install the DHCP server - only required on the first run
InstallDHCPServer -dnsName 'ad.g02-rbmk.internal' -ipAddress '192.168.102.130'

# Create a DHCP scope (added extra dns address)
CreateDHCPv4Scope -scopeName 'Employees' -startRange '192.168.102.2' -endRange '192.168.102.126' -subnetMask '255.255.255.128' -scopeId '192.168.102.0' -routerIP '192.168.102.1'
Set-DhcpServerv4OptionValue -DnsServer "192.168.102.130"

Add-DhcpServerv6Scope -Name 'Employees' -Prefix 'fd69:6f00:73d8:2c11::' -State Active
Add-DhcpServerv6ExclusionRange -Prefix 'fd69:6f00:73d8:2c11::' -StartRange 'fd69:6f00:73d8:2c11:8::1' -EndRange 'fd69:6f00:73d8:2c11:ffff:ffff:ffff:ffff'

Set-DhcpServerv6OptionValue -DnsServer "fd69:6f00:73d8:2c42::2"

write-host "Installation winserv1 completed"