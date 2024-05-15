<#
This script is used to create the winclient1 vm
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
CreateVM -name 'winclient1' -ostype 'Windows10_64' -cores 2 -ram 2048 -rom 32768 -iso $pathToIsoFile -sharedFolder $workingDirectory
