<#
.SYNOPSIS
    Create DHCPv4 Failover and add secondary DNS server
.DESCRIPTION
    This script will start the procedure created to enroll an failover system on the DHCPv4 server in the mode Hot Standby.
    Further more the script adds a secondary DNS server to the list for IPv4 as well as for IPv6.
.NOTES
    This script can only be run if the secondary DNS server is running, otherwise the script will fail.
.LINK
    https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831385(v=ws.11)

.Parameter dns1DCHPv4server
    Contains the original dns server adress from the host.

.Parameter dns2DCHPv4server
    Contains the secondairy address of the dns that needs to be added to create a redundant setup.

.Parameter dns1DCHPv6server
    Contains the original dns server adress from the host.

.Parameter dns2DCHPv6server
    Contains the secondairy address of the dns that needs to be added to create a redundant setup.

.Parameter compName
    Contains the automaticaly generated name of the device.
    
.Parameter partnerName
    Contains teh name of the secondary dhcp server so it can create the failover relation.

.Parameter failoverName
    Contains the name for the failover relation between the 2 servers.
#>

#Parameters
$dns1DCHPv4server = "192.168.102.130"
$dns2DCHPv4server = "192.168.102.136"

$dns1DCHPv6server = "fd69:6f00:73d8:2c42::2"
$dns2DCHPv6server = "fd69:6f00:73d8:2c42::8"

$compName = $env:COMPUTERNAME
$partnerName = 'winserv2'

$failoverName = 'DHCP-winserv1-winserv2-HotStandby'

# Start script
Start-Transcript -Path C:\log.txt -Append

Set-DhcpServerv4OptionValue -DnsServer $dns1DCHPv4server, $dns2DCHPv4server
Set-DhcpServerv6OptionValue -DnsServer $dns1DCHPv6server, $dns2DCHPv6server

Add-DhcpServerv4Failover -ComputerName $compName -PartnerServer $partnerName -Name $failoverName -ServerRole Active -ReservePercent 10 -MaxClientLeadTime 1:00:00 -StateSwitchInterval 00:45:00 -ScopeId 192.168.102.0 -SharedSecret "Rbmk2324"

Write-Host "Run winserv2-dhcp-followup.ps1 on winserv2."