<#
.SYNOPSIS
    Installation script for Active Directory
.DESCRIPTION
    This script will add this server as a secondary domain controller and clone the Active Directory so both servers have the same data.

.LINK
    https://activedirectorypro.com/add-secondary-domain-controller/
    https://activedirectorypro.com/dcdiag-check-domain-controller-health/

.Parameter domainName
    Contains the name of the Active Directory this server needs to clone.

.Parameter pathXmlConfig
    Contains the path to the XML file that contains the pregenerated configuration.

.Parameter compName
    Contains the automaticaly generated name of the device.

.Parameter SecureString
    Contains the function and result of that function to convert a string to securestring.
    This 

.Parameter SecureString2
    Contains the function and result of that function to convert a string to securestring.

.Parameter Credentials
    Contains the credentials of the administrator of the Active Directory domain, this is needed to clone the setup.
#>



$domainName = "ad.g02-rbmk.internal"

$pathXmlConfig = "Z:\AD\DeploymentConfigTemplate.xml"


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
    
function promoteToDomainController {
    #create encrypted 
    
    $SecureString = (ConvertTo-SecureString -String "rbmk2324" -AsPlainText -Force)
    $SecureString2 = (ConvertTo-SecureString -String "Rbmk2324" -AsPlainText -Force)
    $credentials = New-Object System.Management.Automation.PSCredential ("Administrator@ad.g02-rbmk.internal", $SecureString)
    
    #
    # Windows PowerShell-script voor AD DS-implementatie
    #
    
    Import-Module ADDSDeployment
    Install-ADDSDomainController -NoGlobalCatalog:$false -CreateDnsDelegation:$false -Credential $credentials -CriticalReplicationOnly:$false -DatabasePath "C:\Windows\NTDS" -DomainName $domainName -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SiteName "Default-First-Site-Name" -SysvolPath "C:\Windows\SYSVOL" -Force:$true  -SafeModeAdministratorPassword $SecureString2

    
}
function removeTask {
    if (Get-ScheduledTask -TaskName "Start-AfterReboot" -ErrorAction SilentlyContinue -ErrorVariable WindowsServiceExistsError) {
        Unregister-ScheduledTask -TaskName "Start-AfterReboot" -Confirm:$false
    }
}

<#
START SCRIPT
This script is used to create and configure the Acitve Directory
#>

Start-Transcript -Path C:\log.txt -Append
Set-WinUserLanguageList -LanguageList 'nl-be' -Confirm:$false -Force
removeTask

# Install Active Directory

# while ((Test-Connection -ComputerName "ad.g02-rbmk.internal" -Count 1 -Quiet) -eq $false) {
#     Start-Sleep -Seconds 1
# }

Write-Host "Primary DC is available"

if (-Not (Confirm-WindowsServiceExists NTDS)) {
    Install-WindowsFeature -ConfigurationFilePath $pathXmlConfig
}
else {
    write-host "Active Directory is already installed."
}
    
#Upgrade server to domain controller
    
if (Get-WmiObject -Query "select * from Win32_OperatingSystem where ProductType='2'" ) { Write-Host "Server is already DC." } 
else {
    promoteToDomainController
}   

Write-Host 'AD done'