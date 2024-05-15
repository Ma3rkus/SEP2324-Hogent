<# 
.SYNOPSIS
    Startup script for OU & user creation

.DESCRIPTION 
    This script is the followupscript that finishes the installation of the Active Directory and its corresponding features.
    It will deploy the active directory with its users and Organistational Units. At the end of the script, it will automaticaly remove the scheduled 
    task.

.NOTES 
    The script will run automaticaly after the necessary reboot of the server, following the promotion to domaincontroller. Het script zal de nodige 
    At the end it will start the next script, installation of DNS.

.COMPONENT 
    Needs the Active Directory module.

.LINK 
    https://theitbros.com/active-directory-organizational-unit-ou/

# General Parameters
.Parameter pathCSV
    Contains the path to the first CSV. This file contains all the information and properties needed to create the users.

.Parameter pathCSV2
    Contains the path to the second CSV. This file contains all the information and properties needed to create the Organisational Units.

.Parameter driveLetter
    Specifies the leter of the drive, on which the direcotries of the users are made.

.Parameter domain
    Specifies the name of the Active Directory domain.

# Function Parameters
## Function makeDirectory
.Parameter homePath
    Specifies the path to the Home-directory, changed with each new profile.

.Parameter homeShare
    Specifies the path to the Share-directory, changed with each new profile.

## Function createShare
.Parameter name
    Specifies the name of the share, created by this function.

.Parameter path
    Specifies the path to the share, created by this function.

.Parameter user
    Specifies the user for who the share is created by this function.

## Function createOU
.Parameter ldap
    Specifies the LDAP path to the Organisational Units that are to be created, these paths are imported from a CSV-file (CSV2)

.Parameter nameOU
    Specifies the name of the Organisational Units that are to be created, these names are imported from a CSV-file (CSV2)

## Function userCreation
.Parameter gebName
    Specifies the username, used to create the user. This is imported for a CSV-file (CSV1)

.Parameter Dep
    Specifies the department, used to create the user. This is imported for a CSV-file (CSV1)

.Parameter vNaam
    Specifies the fristname, used to create the user. This is imported for a CSV-file (CSV1)

.Parameter aNaam
    Specifies the surname, used to create the user. This is imported for a CSV-file (CSV1)

.Parameter paswd
    Specifies the password, used to create the user. The password is converted to a SecureString as an input value. The password is imported for a CSV-file (CSV1)

.Parameter Name
    Specifies the full name of the user to be created. This name is made by adding the firstname and lastname parameters seperated by an '_'

## Function checkup
.Parameter ServiceName
    Contains the servicename via which we van check if the service is installed. In this scirpt the servicename is NTDS which is the name for Active Directory.

.Parameter arrService
    Contains the result of the lookup of the service in the parameter ServiceName

## Function Confirm-WindowsServiceExists
.Parameter compName
    Contains the name of the active VM/Computer/Server. This is automaticaly generated.
#>


$pathCSV = "Z:\AD\Personel.csv"
$pathCSV2 = "Z:\AD\OU.csv"
$driveLetter = "C"
#$standardPath = "C:\ActiveDirectory\shares\users\"
$domain = "ad.g02-rbmk.internal"


#Functions
function makeDirectory($department, $name) {
    #$departmentPath = "$standardPath\$department"
    #$profilePath = "$departmentPath\$name"
    $homePath = "$homeShare\Home"
    $homeShare = "c:\ActiveDirectory\shares\users\$name"    

    # if (-not (Test-Path -LiteralPath $DepartmentPath)) {
    #     New-Item -Path $DepartmentPath -ItemType Directory
    # }
    # else {
    #     "Directory already existed"
    # }
    createShare -name $name -path $homeShare -user $name
    Set-ADUser $name -ProfilePath "\\winserv1\users\$name"
    New-Item -Path $homePath -ItemType Directory -Force
    Set-ADUser $name -HomeDrive $driveLetter -HomeDirectory "\\winserv1\users\$name\home"
}

function createShare {
    param(
        [Parameter(Mandatory = $true)]
        [string] $name,
        
        [Parameter(Mandatory = $true)]
        [string] $path,

        [Parameter(Mandatory = $true)]
        [String] $user

    )

    if (-not (Test-Path -Path $path)) {
        # Create the directory and share
        New-Item -Path $path -ItemType Directory
        New-SmbShare -Name $name -Path $path -FullAccess $user
        
        # Set the NTFS permissions

        # Get the existing ACL
        $acl = Get-Acl -Path $path
        # Create a new access rule
        $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("$user", "Modify", "ContainerInherit, ObjectInherit", "None", "Allow")
        # Add the access rule to the ACL
        $acl.SetAccessRule($accessRule)
        # Set the ACL
        Set-Acl -Path $path -AclObject $acl
    }
}
#
function removeTask {
    if (Get-ScheduledTask -TaskName "Start-AfterReboot" -ErrorAction SilentlyContinue -ErrorVariable WindowsServiceExistsError) {
        Unregister-ScheduledTask -TaskName "Start-AfterReboot" -Confirm:$false
    }
}

function NewADOU($ouName, $path ) {
    if (-Not([adsi]::Exists("LDAP://OU=$($ouName),$($path)")))
    { New-ADOrganizationalUnit -Name $ouName -Path $path -ErrorAction SilentlyContinue }
}

function createOU {
    Import-Csv -Path $pathCSV2 -Delimiter ";" | ForEach-Object {

        $ldap = $_.Path
        $nameOU = $_.Naam
    
        newADOU $nameOU $ldap
    }
}

function userCreation {

    Import-Csv -Path $pathCSV -Delimiter ";" | ForEach-Object {

        $gebName = $_.Gebruikersnaam
        $Dep = $_.Afdeling
        $vNaam = $_.Voornaam
        $aNaam = $_.Achternaam
        $paswd = $(ConvertTo-SecureString $_.Wachtwoord -AsPlainText -Force)

        $Name = $vNaam + "_" + $aNaam

        if (-NOT(Get-ADUser  -Filter { Name -eq $Name })) {
            Switch ($Dep) {
                "Admin" {
                    New-ADUser -Name $Name -SamAccountName $gebName -GivenName $vNaam -Surname $aNaam -UserPrincipalName "$($gebName)@$($domain)" -Path "OU=NetworkAdministrators,OU=RBMK-Users,DC=ad,DC=G02-RBMK,DC=internal"-AccountPassword $paswd -Enabled $true -Department $Dep -ChangePasswordAtLogon $True
                    Add-ADGroupMember "Domain Admins" $gebName
                }
                "Management" { New-ADUser -Name $Name  -SamAccountName $gebName -GivenName $vNaam -Surname $aNaam -UserPrincipalName "$($gebName)@$($domain)" -Path "OU=Management,OU=RBMK-Users,DC=ad,DC=G02-RBMK,DC=internal"-AccountPassword $paswd -Enabled $true -Department $$Dep -ChangePasswordAtLogon $True }
                "Development" { New-ADUser -Name $Name  -SamAccountName $gebName -GivenName $vNaam -Surname $aNaam -UserPrincipalName "$($gebName)@$($domain)" -Path "OU=Development,OU=RBMK-Users,DC=ad,DC=G02-RBMK,DC=internal"-AccountPassword $paswd -Enabled $true -Department $$Dep -ChangePasswordAtLogon $True }
                "HR" { New-ADUser -Name $Name  -SamAccountName $gebName -GivenName $vNaam -Surname $aNaam -UserPrincipalName "$($gebName)@$($domain)" -Path "OU=HR,OU=RBMK-Users,DC=ad,DC=G02-RBMK,DC=internal"-AccountPassword $paswd -Enabled $true -Department $Dep -ChangePasswordAtLogon $True }
                "Sales" { New-ADUser -Name $Name  -SamAccountName $gebName -GivenName $vNaam -Surname $aNaam -UserPrincipalName "$($gebName)@$($domain)" -Path "OU=Sales,OU=RBMK-Users,DC=ad,DC=G02-RBMK,DC=internal"-AccountPassword $paswd -Enabled $true -Department $Dep -ChangePasswordAtLogon $True }
                "Public-Relations" { New-ADUser -Name $Name  -SamAccountName $gebName -GivenName $vNaam -Surname $aNaam -UserPrincipalName "$($gebName)@$($domain)" -Path "OU=PublicRelations,OU=RBMK-Users,DC=ad,DC=G02-RBMK,DC=internal"-AccountPassword $paswd -Enabled $true -Department $Dep -ChangePasswordAtLogon $True }
                "Extern" { New-ADUser -Name $Name -SamAccountName $gebName -GivenName $vNaam -Surname $aNaam -UserPrincipalName "$($gebName)@$($domain)" -Path "OU=Extern,OU=RBMK-Users,DC=ad,DC=G02-RBMK,DC=internal"-AccountPassword $paswd -Enabled $true -Department $Dep -ChangePasswordAtLogon $True }
            }    
        }
        
        makeDirectory $Dep $gebName
    }

}

function checkUp {
    $ServiceName = 'ntds'
    $arrService = Get-Service -Name $ServiceName

    while ($arrService.Status -ne 'Running') {
        Start-Sleep -seconds 1
        $arrService.Refresh()
        if ($arrService.Status -eq 'Running') {
            Write-Host 'Active Directory is running'
        }

    }
}

function importGPO {
    # Import and link user-level GPO
    Import-GPO -BackupGpoName RBMK-Users -Path "Z:\AD" -TargetName RBMK-Users -CreateIfNeeded
    New-GPLink -Name RBMK-Users -Target "ou=RBMK-Users,dc=ad,dc=g02-rbmk,dc=internal" -LinkEnabled Yes

    # Import and link computer-level GPO
    Import-GPO -BackupGpoName RBMK-Computers -Path "Z:\AD" -TargetName RBMK-Computers -CreateIfNeeded
    New-GPLink -Name RBMK-Computers -Target "ou=RBMK-Computers,dc=ad,dc=g02-rbmk,dc=internal" -LinkEnabled Yes
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

function startDNS {
    if (Confirm-WindowsServiceExists NTDS) {
        Write-Host "Start DNS installation"
        & 'Z:\DNS\winserv1-dns-config.ps1'
    }
}

function startCA {
    if (Confirm-WindowsServiceExists NTDS) {
        Write-Host "Start CA installation"
        & 'Z:\CA\winserv1-CA-config.ps1'
    }
}

# Main
Start-Transcript -Path C:\log.txt -Append
checkUp
createOU
userCreation
removeTask
importGPO
startDNS
startCA