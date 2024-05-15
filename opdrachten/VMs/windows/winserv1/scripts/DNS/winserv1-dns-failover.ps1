<#
.SYNOPSIS
    Scripts to start the DNS failoversystel
.DESCRIPTION
    This is a redundant script it start the DNS failover system.
.Parameter dnsServers
    Contains the IP addresses for the dnsservers. The sequence is important. It is first the own dns server followed by the secondary server.
    It is first IPv4 and teh IPv6.

.Parameter sourcePath
    Contains the path, including the ip-address, to the location where the exported DNS configuration is saved.

.Parameter destinationPath
    Contains the path, including the ip-address, to the location where the exported DNS configuration need to be copied to.
    
#>

#Parameters
$dnsServers = ('192.168.102.130', '192.168.102.136', 'fd69:6f00:73d8:2c42::2', 'fd69:6f00:73d8:2c42::8')
$sourcePath = '\\192.168.102.130\C$\WINDOWS\system32\dns\dns-export.bak'
$destinationPath = '\\192.168.102.136\C$\dns-export.bak'

#Start Script
Start-Transcript -Path C:\log.txt -Append

Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses $dnsServers
Export-DNSServerZone "g02-rbmk.internal" "dns-export.bak"
Copy-Item -Path $sourcePath -Destination $destinationPath

Write-Host 'DNs failover done'