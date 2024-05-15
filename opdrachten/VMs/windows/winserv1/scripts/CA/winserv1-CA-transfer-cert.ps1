<#
Transfer the certificate to the web server
#>

function TransferCertificate {
    param(
        [Parameter(Mandatory = $true)]
        [string]$certificateName,
        [Parameter(Mandatory = $true)]
        [string]$certificatePath,
        [Parameter(Mandatory = $true)]
        [string]$remoteServer,
        [Parameter(Mandatory = $true)]
        [string]$remoteDirectory,
        [Parameter(Mandatory = $true)]
        [string]$remoteUser
    )

    try {
        # Check if the ssh directory already exists
        if (-not (Test-Path -Path "$env:USERPROFILE\.ssh")) {
            # Create the directory
            New-Item -ItemType Directory -Path "$env:USERPROFILE\.ssh"
        }
                
        # Copy the ssh keys to local ssh directory
        Copy-Item -Path "Z:\CA\id_rsa" -Destination "$env:USERPROFILE\.ssh\id_rsa" -Force
        Copy-Item -Path "Z:\CA\id_rsa.pub" -Destination "$env:USERPROFILE\.ssh\id_rsa.pub" -Force

        # Copy the certificate to the remote server
        Write-Information "Copying the web certificate to proxy1" -InformationAction Continue
        scp "$certificatePath\$certificateName.pfx" "${remoteUser}@${remoteServer}:${remoteDirectory}\$certificateName.pfx"

        # Connect to the remote server and extract the certificate
        Write-Information "Converting the web certificate public key on proxy1" -InformationAction Continue
        ssh ${remoteUser}@${remoteServer} "sudo openssl pkcs12 -in /home/vagrant/web.pfx -clcerts -nokeys -out /etc/nginx/ssl/g02-rbmk.internal.crt -passin pass:rbmk2324"
        Write-Information "Converting the web certificate private key on proxy1" -InformationAction Continue
        ssh ${remoteUser}@${remoteServer} "sudo openssl pkcs12 -in /home/vagrant/web.pfx -nocerts -nodes -passin pass:rbmk2324 | sudo openssl rsa -out /etc/nginx/ssl/g02-rbmk.internal.key"
        Write-Information "Cleaning up and restarting proxy1" -InformationAction Continue
        ssh ${remoteUser}@${remoteServer} "rm /home/vagrant/web.pfx"
        ssh ${remoteUser}@${remoteServer} "sudo systemctl restart nginx"

    } catch {
        # Write the error to the console
        Write-Error "$_"
    }
}

$certificatePath = "$env:USERPROFILE\Documents"

# Transfer the certificate to the web server
TransferCertificate -certificateName 'web' -certificatePath $certificatePath -remoteServer '192.168.102.226' -remoteDirectory '~' -remoteUser 'vagrant'