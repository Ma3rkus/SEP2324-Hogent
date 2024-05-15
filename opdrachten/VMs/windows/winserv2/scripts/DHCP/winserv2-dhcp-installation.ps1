<#
.SYNOPSIS
    Installation script for DHCP
.DESCRIPTION
    Installs DHCP and start the configuration, it stops the configuration right before the scope setup. That will be created in the followup script

.Parameter dnsName
    Contains the domain name of the DNS server

.Parameter ipAddress
    Contains the IP address of the DNS server hosted on this device/server.
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

Start-Transcript -Path C:\log.txt -Append

# Install the DHCP server - only required on the first run
InstallDHCPServer -dnsName 'ad.g02-rbmk.internal' -ipAddress '192.168.102.136'

Write-Host "Run winserv1-dhcp-failover.ps1 on winserv1."