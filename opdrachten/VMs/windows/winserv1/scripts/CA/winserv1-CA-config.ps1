<#

#>
<#
.SYNOPSIS
    CA installation script for winserv1
.DESCRIPTION
    A longer description of the function, its purpose, common use cases, etc.
.Parameter
#>



function InstallCAServer {
    param(
        [Parameter(Mandatory = $true)]
        [string]$rootCAName
    )

    try {
        # Check if the CA role is installed
        if ((Get-WindowsFeature -Name 'ADCS-Cert-Authority').InstallState -ne 'Installed') {
            # Install the CA server role
            Add-WindowsFeature Adcs-Cert-Authority -IncludeManagementTools
        
            Install-AdcsCertificationAuthority -Force -CACommonName $rootCAName -CADistinguishedNameSuffix "C=BE, O=RBMK, L=Gent, S=Oost-Vlaanderen" -CAType EnterpriseRootCA -KeyLength 4096 -OverwriteExistingCAinDS -OverwriteExistingDatabase -OverwriteExistingKey -ValidityPeriod Years -ValidityPeriodUnits 10
        }
    }
    catch {
        # Write the error to the console and exit
        Write-Error "$_"
        exit 1
    }
}

function RequestCertificate {
    param(
        [Parameter(Mandatory = $true)]
        [string]$CAName,
        [Parameter(Mandatory = $true)]
        [string]$certificateName,
        [Parameter(Mandatory = $true)]
        [string]$certificatePath
    )

    try {
        # Wait until the Remote Procedure Call (RPC) service is running
        $service = (Get-Service -Name 'RpcSs')
        Write-Host "Waiting until $service is running"
        while ($service.Status -ne 'Running') {
            Write-Host '.' -NoNewline
            Start-Sleep -seconds 1
            $service.Refresh()
        }

        # Check if the certificate already exists
        if (-not (Test-Path -Path $certificatePath)) {
            # Create the directory
            New-Item -ItemType Directory -Path $certificatePath
        }

        # Request a certificate
        certreq -new -f "Z:\CA\cert-request-$certificateName.inf" "$certificatePath\$certificateName.csr"

        # Submit the certificate request
        certreq -submit -f -config "$env:COMPUTERNAME\$CAName" "$certificatePath\$certificateName.csr" "$certificatePath\$certificateName.cer"
        
        # Cleanup
        Remove-Item "$certificatePath\$certificateName.rsp"
        Remove-Item "$certificatePath\$certificateName.csr"
    }
    catch {
        # Write the error to the console
        Write-Error "$_"
    }
}

function ExportCertificate {
    param(
        [Parameter(Mandatory = $true)]
        [string]$certificateName,
        [Parameter(Mandatory = $true)]
        [string]$certificatePath,
        [bool]$rootCertificate = $false
    )

    try {
        if ($rootCertificate -eq $true) {
            # Get the certificate by name
            $cert = Get-ChildItem -Path cert:\LocalMachine\Root | Where-Object { $_.Subject -like "*$certificateName*" }

            # Export the public key of the certificate
            Export-Certificate -Cert $cert[0].PSPath -FilePath $certificatePath
        }
        else {
            # Import the certificate
            $thumbprint = (Import-Certificate -FilePath "$certificatePath\$certificateName.cer" -CertStoreLocation Cert:\LocalMachine\My).Thumbprint

            # Find the certificate thumbprint
            $cert = Get-ChildItem -Path cert:\LocalMachine\My\$thumbprint

            # Export the private key
            $password = ConvertTo-SecureString -String "rbmk2324" -Force -AsPlainText
            Export-PfxCertificate -Cert $cert[0].PSPath -FilePath "$certificatePath\$certificateName.pfx" -Password $password
        }
    }
    catch {
        # Write the error to the console
        Write-Error "$_"
    }
}

# Define variables
$rootCAName = 'RBMK Root Certification Authority'
$certificatePath = 'C:\Users\Administrator\Documents'

# Install the CA server role
InstallCAServer -rootCAName $rootCAName

# Request the web server wildcard certificate
RequestCertificate -certificateName 'web' -CAName $rootCAName -certificatePath $certificatePath

# Export the certificates
ExportCertificate -certificateName 'web' -certificatePath $certificatePath
ExportCertificate -certificateName $rootCAName -certificatePath 'C:\ActiveDirectory\shares\certificates\root.cer' -rootCertificate $true

Write-Host 'CA installation completed'