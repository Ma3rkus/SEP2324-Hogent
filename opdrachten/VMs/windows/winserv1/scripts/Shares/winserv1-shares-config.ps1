<#
.SYNOPSIS
    Share creation script.
.DESCRIPTION
    This script is used to create the necessary shares on the winserv1 VM.

.Parameter name
    Contains the name that will be the main identifier of the share.

.Parameter path
    Contains the path where the share will be created.

.Parameter acl
    Contains the current acl.

.Parameter ruleToAllow
    Contains an accessrule for the filesystem that needs to be added to the share for security reasons.

#>



function CreateShare {
    param(
        [Parameter(Mandatory = $true)]
        [string] $name,
        
        [Parameter(Mandatory = $true)]
        [string] $path
    )

    if (-not (Test-Path -Path $path)) {
        # Create the directory and share
        New-Item -Path $path -ItemType Directory
        New-SmbShare -Name $name -Path $path
        
        # Set the NTFS permissions
        # Get the current ACL
        $acl = Get-Acl $path

        # Create a new rule to allow ReadAndExecute and Synchronize for BUILTIN\Users
        $ruleToAllow = New-Object System.Security.AccessControl.FileSystemAccessRule(
            'BUILTIN\Users', 
            'ReadAndExecute, Synchronize', 
            'ContainerInherit, ObjectInherit', 
            'None', 
            'Allow'
        )
    
        # Add the rule
        $acl.AddAccessRule($ruleToAllow)
        
        # Set the new ACL to the directory
        Set-Acl $path $acl
    }
}

CreateShare -name 'clients' -path 'C:\ActiveDirectory\shares\clients'
CreateShare -name 'certificates' -path 'C:\ActiveDirectory\shares\certificates'