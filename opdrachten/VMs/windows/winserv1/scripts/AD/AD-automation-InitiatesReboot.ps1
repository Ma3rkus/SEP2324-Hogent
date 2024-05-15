<# 
.SYNOPSIS
    Startup script for Active Directory

.DESCRIPTION 
    This scrpit marks the start of the deployment of Active Directory. 
    It starts the installation and creates a scheduled task to continue the installation after a necessary restart, for the promotion of this server to domain controller.

.NOTES 
    First script to run after the creaton of the server.

.LINK 
    https://learn.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2022-ps

# General Parameters
.Parameter domainName
    Specifies the name of the Active Directory domain.

.Parameter NetBios
    Specifies the name of the NetBIOS of the Active Directory.

.Parameter PathRebootScript
    Specifies the path to the followup-script. This will be added to the scheduled task.

.Parameter PathXmlConfig
    Contains the path to the XML configuration-file, this file is used to automate the deployment of the service Active Directory.

# Function Parameters
## Function Confirm-WindowsServiceExists
.Parameter compName
    Contains the automaticaly generated name of the device.
    
## Function promoteToDomainController
.Parameter SecureString
    Variable that converts a string to a securestring.

## Function prepareReboot
.Parameter action
    Contains the action used to create a scheduled task.

.Parameter trigger
    Contains the trigger / action that needs to take place to start the scheduled task.

All parameters for idempotent Scripting
#>

$domainName = "ad.g02-rbmk.internal"
$netBios = "G02-RBMK"

$pathRebootScript = "Z:\AD\AD-automation-AfterReboot.ps1"
$pathXmlConfig = "Z:\AD\DeploymentConfigTemplate.xml"

<# 
Functions
#>
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
    
    $SecureString = (ConvertTo-SecureString -String "23Admin24" -AsPlainText -Force)
    #
    # Windows PowerShell-script voor AD DS-implementatie
    #
    
    Import-Module ADDSDeployment
    Install-ADDSForest -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "WinThreshold" -DomainName $domainName -DomainNetbiosName $netBios -ForestMode "WinThreshold" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$false -SafeModeAdministratorPassword $SecureString -SysvolPath "C:\Windows\SYSVOL" -Force:$true
    
}
    
function prepareReboot {
    $action = New-ScheduledTaskAction -Execute "%windir%\System32\WindowsPowerShell\v1.0\powershell.exe" -Argument " -Noninteractive -ExecutionPolicy Bypass -Noprofile -file $($pathRebootScript)"
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "Start-AfterReboot" -RunLevel Highest -User SYSTEM -Force
}
    
<#

START SCRIPT
    This script is used to create and configure the Acitve Directory
    #>

Start-Transcript -Path C:\log.txt -Append

# Install Active Directory
if (-Not (Confirm-WindowsServiceExists NTDS)) {
    Install-WindowsFeature -ConfigurationFilePath $pathXmlConfig
}
else {
    write-host "Active Directory is already installed."
}
    
#Upgrade server to domain controller
    
if (Get-WmiObject -Query "select * from Win32_OperatingSystem where ProductType='2'" ) { Write-Host "Server is already DC." } 
else {
    prepareReboot
    promoteToDomainController
}   