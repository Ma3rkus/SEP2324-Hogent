<#
.SYNOPSIS
    DHCP followup script for winserv1
.DESCRIPTION
    This script will replicate the scopes from teh other DHCP server in a failover replication.   
#>


function cloneDHCPv4Scope {
    Invoke-DhcpServerv4FailoverReplication -ComputerName 'winserv1' -Name 'DHCP-winserv1-winserv2-HotStandby'
}

if ((Get-DhcpServerv4Failover).Name -eq "DHCP-winserv1-winserv2-HotStandby") {
    cloneDHCPv4Scope
}
else {
    Write-Host "No Failover found"
}


Start-Transcript -Path C:\log.txt -Append

cloneDHCPv4Scope
Set-DhcpServerv4OptionValue -DnsServer "192.168.102.130", "192.168.102.136"
Set-DhcpServerv4OptionValue -ScopeId '192.168.102.0' -OptionId 3 -Value '192.168.102.1'

Add-DhcpServerv6Scope -Name 'Employees' -Prefix "fd69:6f00:73d8:2c11::" -State Active
Add-DhcpServerv6ExclusionRange -Prefix 'fd69:6f00:73d8:2c11::' -StartRange 'fd69:6f00:73d8:2c11::1' -EndRange 'fd69:6f00:73d8:2c11:7fff:ffff:ffff:ffff'

Set-DhcpServerv6OptionValue -DnsServer "fd69:6f00:73d8:2c42::2", "fd69:6f00:73d8:2c42::8"