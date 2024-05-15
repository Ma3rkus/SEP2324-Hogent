<#
This script is used to create a Windows Server 2022 Standard or Windows 10 Education VM
!! You do not need to execute this script manually !! This won't have any effect
#>

# Username of the current user
$user = $env:UserName

# Group name in VirtualBox
$group = "SEP"

# Path of the VMs
$installationPath = "C:\Users\$user\VirtualBox VMs\$group"

# Add the VirtualBox path to the PATH environment variable
$env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"

function DeleteVM {
    param([string] $name = '')

    try {
        # Get the list of running VMs
        $runningVMs = VBoxManage.exe list runningvms

        # Check if the VM is running
        if ($runningVMs -match $name) {
            VBoxManage.exe controlvm $name poweroff
            Start-Sleep -Seconds 1
        } 
        VBoxManage.exe unregistervm $name --delete
    } catch {
        Write-Error "An error occurred while deleting the following VM: $name`nExiting now..."
        exit 1
    }
}

function CreateVM {
    param(
        [string] $name = '',
        [string] $ostype = '',
        [int] $cores = '',
        [int] $ram = '',
        [bool] $cli = $false,
        [string] $gc = 'VBoxSVGA',
        [int] $rom = '',
        [string] $iso = '',
        [string] $sharedFolder = '')

    try {
        # Define product key based on ostype
        $productKey = switch ($ostype) {
            'Windows2022_64' { 'VDYBN-27WPP-V4HQT-9VMD4-VMK7H' } # Windows Server 2022 Standard
            'Windows10_64' { 'NW6C2-QMPVW-D7KKK-3GKT6-VCFB2' } # Windows 10 Education
            default { '' }
        }

        # Assign vram based on cli/gui
        $vram = switch ($cli) {
            $true { 64 }
            $false { 128 }
        }

        # Check if the VM already exists and if so, ask user permission to overwrite it
        $allVMs = VBoxManage.exe list vms
        if ($allVMs -match $name) {
            # Prompt the user to continue or not
            Write-Warning "The VM $name already exists.`nIf you continue, the existing VM will be overwritten."
            $userInput = Read-Host "Do you want to continue? y/N"

            # Check the user input
            if ($userInput -eq "Y" -and $userInput -eq "y") {
                DeleteVM -name $name
            } else {
                Read-Host -Prompt "Press any key to exit"
                exit
            }
        }

        # Create VM
        VBoxManage.exe createvm --name $name --register --groups "/$group" --ostype $ostype
        VBoxManage.exe modifyvm $name --memory $ram --vram $vram --cpus $cores --graphicscontroller $gc --pae=off
            
        # Install internal network adapter
        VBoxManage.exe modifyvm $name --nic1="intnet" --intnet1="intnet" --nictype1 82540EM

        # Add a SATA controller
        VBoxManage.exe storagectl $name --name "SATA Controller" --add sata --controller IntelAHCI

        # Create and attach the VDI file as a hard drive
        $createHdOutput = VBoxManage.exe createhd --filename "$installationPath\$name\$name.vdi" --size $rom --variant Standard 
        $newUuid = ($createHdOutput -split ' ')[-1]
        VBoxManage.exe storageattach $name --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$newUuid"

        # Attach a shared folder as read-only so it doesn't fuck up the git repo
        VBoxManage.exe sharedfolder add $name --name "Shared" --hostpath "$sharedFolder" --automount --readonly

        # Start the unattended installation
        VBoxManage.exe unattended install $name --iso=$pathToIsoFile --user=Administrator --password=rbmk2324 --key=$productKey --install-additions --locale=nl_BE --country=BE --time-zone=Europe/Brussels --hostname=$name.ad.g02-rbmk.internal --post-install-template=$name-post-install.cmd

        # Start the VM
        VBoxManage.exe startvm $name --type=headless

    } catch {
        Write-Error "An error occurred while creating the following VM: $name`nExiting now..."
        exit 1
    }
}