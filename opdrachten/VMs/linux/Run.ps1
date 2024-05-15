param (
    [switch]$test,
    [switch]$db,
    [switch]$web,
    [switch]$proxy,
    [switch]$nc
)


$location = Get-Location

Write-Host $location

if ($db) {
    Start-Job -ScriptBlock {
        param ([string]$vmName, [string]$scirptLocation)
        Set-Location $scirptLocation
        vagrant.exe up $vmName
    } -ArgumentList "db1", $location
}
if ($web) {
    Start-Job -ScriptBlock {
        param ([string]$vmName, [string]$scirptLocation)
        Set-Location $scirptLocation
        vagrant.exe up $vmName
    } -ArgumentList "web1", $location
}
if ($proxy) {
    Start-Job -ScriptBlock {
        param ([string]$vmName, [string]$scirptLocation)
        Set-Location $scirptLocation
        vagrant.exe up $vmName
    } -ArgumentList "proxy1", $location
}
if ($nc) {
    Start-Job -ScriptBlock {
        param ([string]$vmName, [string]$scirptLocation)
        Set-Location $scirptLocation
        vagrant.exe up $vmName
    } -ArgumentList "nextcloud", $location
}

# Wait for all jobs to finish
Get-Job | Wait-Job

# Get the logs
# Get-Job | Receive-Job

# Clean up jobs
Get-Job | Remove-Job

vagrant.exe halt

$vmsList = & "VBoxManage.exe" list vms
$vmsUuids = @()

foreach ($line in $vmsList) {
    if ($line -match '^"((linux_db1|linux_web1|linux_proxy1|linux_nextcloud).+?)"') {
        $uuid = $($( $line -split ' ')[1] -replace '[{}]', '' )
        $vmsUuids += $uuid
    }
}

foreach ($uuid in $vmsUuids) {
    if ( $test ) {
        VBoxManage.exe modifyvm $uuid --nic1 intnet --nic2 none    
    } else {
        VBoxManage.exe modifyvm $uuid --nic1 bridged --nic2 none    
    }
    VBoxManage.exe startvm $uuid --type=headless
}