<#
Import root certificate script for winclient1
#>

# Unregister the root certificate import script
Unregister-ScheduledTask -TaskName "import-root-certificate" -Confirm:$false

# Define variables
$certificatePath = '\\winserv1\certificates\root.cer'

# Import the .cer file as a trusted root certificate
Import-Certificate -FilePath $certificatePath -CertStoreLocation Cert:\\LocalMachine\\Root