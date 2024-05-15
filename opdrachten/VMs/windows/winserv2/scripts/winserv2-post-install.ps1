<#
Post-installation script for winserv2
#>

# Set the execution policy to unrestricted for the current user and local machine
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser -Force
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force
Start-Transcript -Path C:\log.txt -Append

# Define the network settings here
$ipAddress = '192.168.102.136'
$ipv6Address = 'fd69:6f00:73d8:2c42::8'
$prefixLength = 27
$prefixLengthv6 = 64
$gateway = '192.168.102.129'
$gatewayv6 = 'fd69:6f00:73d8:2c42::1'
$pathRebootScript = "Z:\AD\winserv2-installAD.ps1"

# Functions
function prepareReboot {
    $action = New-ScheduledTaskAction -Execute "%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument " -Noninteractive -ExecutionPolicy Bypass -Noprofile -file $($pathRebootScript)"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Start-AfterReboot" -RunLevel Highest -User SYSTEM -Force
}

function domain {
    $password = ConvertTo-SecureString "rbmk2324" -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential ("G02-RBMK\Administrator", $password)
    while ((Test-Connection -ComputerName "ad.g02-rbmk.internal" -Count 1 -Quiet) -eq $false) {
        Start-Sleep -Seconds 1
    }
    Add-Computer -DomainName "ad.g02-rbmk.internal" -Restart -Credential $cred
}

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

        # Set the DNS server
        
    }
    
}

ipAdding -family IPv4 -ip $ipAddress -prefix $prefixLength -gate $gateway
ipAdding -family IPv6 -ip $ipv6Address -prefix $prefixLengthv6 -gate $gatewayv6

Set-DnsClientServerAddress -InterfaceAlias 'Ethernet' -ServerAddresses ('192.168.102.130')

# This should be the last command in the script
# Unregister the post-installation script
Unregister-ScheduledTask -TaskName "post-install.ps1" -Confirm:$false
Set-WinUserLanguageList -LanguageList 'nl-be' -Confirm:$false -Force
prepareReboot
domain
