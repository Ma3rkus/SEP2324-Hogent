<#
.SYNOPSIS
    Script that starts the full autonomous deployment of winserv1
.DESCRIPTION
    This scripts is the starting point of the automated deployment system that starts from a new windows serer 2022.

.Parameter compName
    Contains the automaticaly generated name of the device.
#>

# shares
# copy wallpaper .\.editorconfig
# Dhcp
# ad
# dns

$compName = $env:COMPUTERNAME

function Confirm-WindowsServiceExists($name) {   
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

# Install Shares
& 'Z:\Shares\winserv1-shares-config.ps1'
Copy-Item -Path 'Z:\AD\Wallpaper.jpg' -Destination 'C:\ActiveDirectory\shares\clients\Wallpaper.jpg' -Force

# Install AD
if ([System.IO.File]::Exists("\\$compName\clients\Wallpaper.jpg")) {
    & 'Z:\AD\AD-automation-InitiatesReboot.ps1'
}
#else {
#    Write-Error "DHCP Server not installed"
#    exit 1
#}

# Install DNS
# if (Confirm-WindowsServiceExists NTDS) {
#     & 'Z:\DNS\winserv1-dns-config.ps1'
# }
# else {
#     Write-Error "DNS not installed"
#     exit 1    
# }
