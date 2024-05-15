<#
Post-installation script for winclient1
#>

# Unregister the post-installation script
Unregister-ScheduledTask -TaskName "post-install.ps1" -Confirm:$false

# Set the locale to Belgian (Period)
Set-WinUserLanguageList -Force 'nl-BE'

# IMPORTANT: set this command in comment when using hardware network!!!
& 'Z:\winclient1-set-intnet-ip.ps1'

# Wait until ad.g02-rbmk.internal is resolvable/pingable
while ((Test-Connection -ComputerName "ad.g02-rbmk.internal" -Count 1 -Quiet) -eq $false) {
    Start-Sleep -Seconds 1
}

# Create the scheduled task to run the root certificate import script
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File 'Z:\winclient1-root-cert-import.ps1'"
$trigger = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "import-root-certificate" -RunLevel HIGHEST -User SYSTEM -Force

# Join the domain
$password = ConvertTo-SecureString "rbmk2324" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential ("G02-RBMK\Administrator", $password)
Add-Computer -DomainName "ad.g02-rbmk.internal" -Restart -OUPath "OU=RBMK-Computers,DC=ad,DC=G02-RBMK,DC=internal" -Credential $cred