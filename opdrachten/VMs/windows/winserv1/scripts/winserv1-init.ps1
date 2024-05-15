<#
This script is used to create the winserv1 vm
#>

# Give the path to the ISO file as an argument
param (
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$pathToIsoFile
)

# Path to the working directory
$workingDirectory = Get-Location

# Import the init-common.ps1 script
. "..\..\init-common.ps1"

# Create the VM
CreateVM -name 'winserv1' -ostype 'Windows2022_64' -cores 1 -ram 4096 -cli $true -rom 40960 -iso $pathToIsoFile -sharedFolder $workingDirectory
