<#
.SYNOPSIS
    DNS installation script for winserv1
.DESCRIPTION
    This script installs and configures the DNS server for Winser1.

.Parameter dnsForwarderAddresses
    Contains an array of the external DNS servers that can be used for external request.

.Parameter networkID
    Contains the ip-address with the corresponding subnetmask.

.Parameter zoneName
    Contains the name of the zone used by the DNS for the internal network.

.Parameter compName
    Contains the automaticaly generated name of the device.
    
.Parameter zone
    Contains the result of an lookup query. This parameter is used to check if the zone is already installed. If not, the script will create and fill the zone.

.Parameter CNameRecords
    Contains a list of properties that are needed to create the necessary CName records.

.Parameter existingRecord
    Contains the result of a lookup query taht returns a boolean if the records exist already.
#>



# Parameters
$dnsForwarderAddresses = "8.8.8.8", "8.8.4.4", "172.22.128.1" #Added the external DNS offered by hogent
$networkID = "192.168.102.0/24" # The CIDR prefix is /27 in real life, but /24 should be used here because limitations of Windows Server and to simplify the reverse lookup zone
$zoneName = "g02-rbmk.internal"

#Functions
function InstallDNS {
    param(
        [Parameter(Mandatory = $true)]
        [string[]] $dnsForwarderAddresses,
        
        [Parameter(Mandatory = $true)]
        [string] $networkID,
        
        [Parameter(Mandatory = $true)]
        [string] $zoneName

    )
    Install-WindowsFeature -Name DNS -IncludeManagementTools

    # Configure DNS forwarder
    Set-DnsServerForwarder -IPAddress $dnsForwarderAddresses

    # Configure the DNS server to only listen on the specified IP address --- NOT NEEDED BECAUSE ONLY ONE IP ADDRESS IS CONFIGURED
    Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses ('192.168.102.130', 'fd69:6f00:73d8:2c42::2')

    # Create the forward lookup zone
    Add-DnsServerPrimaryZone -Name $zoneName -ReplicationScope Forest -DynamicUpdate "Secure"

    # Create the reverse lookup zone
    Add-DnsServerPrimaryZone -NetworkId $networkId -ReplicationScope Forest -DynamicUpdate "Secure"
}
function Confirm-WindowsServiceExists($name) {   
    $compName = $env:COMPUTERNAME
    if (Get-Service -Name $name -Computername $compName -ErrorAction SilentlyContinue -ErrorVariable WindowsServiceExistsError) {
        Write-Host "$name Exists on $server"
        return $true
    }
    
    if ($WindowsServiceExistsError) {
        Write-Host "$server" $WindowsServiceExistsError[0].exception.message
    }
    
    return $false
}

Start-Transcript -Path C:\log.txt -Append

# Get the forward lookup zone
$zone = Get-DnsServerZone -Name $zoneName -ErrorAction SilentlyContinue

# Check if the forward lookup zone exists
if ($null -eq $zone) {
    InstallDNS -dnsForwarderAddresses $dnsForwarderAddresses -networkID $networkID -zoneName $zoneName
}

# Create A-records
Add-DnsServerResourceRecordA -Name "." -ZoneName $zoneName -IPv4Address "192.168.102.226" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "db1" -ZoneName $zoneName -IPv4Address "192.168.102.131" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "web-bas1" -ZoneName $zoneName -IPv4Address "192.168.102.132" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "web-ext1" -ZoneName $zoneName -IPv4Address "192.168.102.132" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "web-bas2" -ZoneName $zoneName -IPv4Address "192.168.102.137" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "web-ext2" -ZoneName $zoneName -IPv4Address "192.168.102.134" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "nc1" -ZoneName $zoneName -IPv4Address "192.168.102.134" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "matrix1" -ZoneName $zoneName -IPv4Address "192.168.102.135" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "proxy1" -ZoneName $zoneName -IPv4Address "192.168.102.226" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordA -Name "tftp" -ZoneName $zoneName -IPv4Address "192.168.102.195" -CreatePtr -ErrorAction SilentlyContinue

Add-DnsServerResourceRecordAAAA -Name "." -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c13::2" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "db1" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c42::3" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "web-bas1" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c42::4" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "web-ext1" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c42::4" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "web-bas2" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c42::9" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "web-ext2" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c42::6" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "nc1" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c42::6" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "matrix1" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c42::7" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "proxy1" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c13::2" -CreatePtr -ErrorAction SilentlyContinue
Add-DnsServerResourceRecordAAAA -Name "tftp" -ZoneName $zoneName -IPv6Address "fd69:6f00:73d8:2c01::3" -CreatePtr -ErrorAction SilentlyContinue
# Create CNAME-records

$CNameRecords = @(
    @{Name = "www"; HostNameAlias = "proxy1.$zoneName." }
    @{Name = "ext"; HostNameAlias = "proxy1.$zoneName." }
    @{Name = "nextcloud"; HostNameAlias = "proxy1.$zoneName." }
)

foreach ($record in $CNameRecords) {
    $existingRecord = Get-DnsServerResourceRecord -Name $record.Name -ZoneName $zoneName -RRType CNAME -ErrorAction SilentlyContinue
    if (!$existingRecord) {
        Add-DnsServerResourceRecordCName -Name $record.Name -HostNameAlias $record.HostNameAlias -ZoneName $zoneName
    }
}



# Restart the DNS service
Restart-Service DNS

& 'Z:\DHCP\winserv1-dhcp-install.ps1'