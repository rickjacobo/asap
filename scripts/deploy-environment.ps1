param (
    [parameter(mandatory=$true,position=1)]
    $Configuration,
    [Switch]$Force
)
#Requires -Version 7.0
#Requires -PSEdition Core
cd $PSScriptRoot

$Container = "rickjacobo/asap:latest"

docker pull $Container

if ($Force){}
else {
./review-configuration.ps1 -Configuration $Configuration
}


if (Test-Path -Path ../.env){}
else {./set-environmentvariables.ps1}
$EnvironmentVariables = Get-Content ../.env | ConvertFrom-Json
$VIServer = $EnvironmentVariables.VIServer
$VIServerUser = $EnvironmentVariables.VIServerUser
$VIServerPassword = $EnvironmentVariables.VIServerPassword

$CSVImport = Import-CSV $Configuration | sort-object ComputerName
$CSVImport | Foreach {
    $Cloud = $_.Cloud
    $Type = $_.Type
    $ComputerName = $_.ComputerName
    $VMHost = $_.VMHost
    $NetworkName = $_.NetworkName
    $Datastore = $_.Datastore
    $MemoryGB = $_.MemoryGB
    $NumCpu = $_.NumCpu
    $Template = $_.Template
    $AdditionalDiskGB = $_.AdditionalDiskGB
    $SnapshotVM = $_.SnapshotVM
    $Snapshot = $_.Snapshot

    if ($Type -eq "template"){
        if ($AdditionalDiskGB -gt "0") {
        try {docker run --rm -e ENV_VISERVER=$VIServer -e ENV_VISERVER_USER=$VIServerUser -e ENV_VISERVER_PASSWORD=$VIServerPassword $Container pwsh $Cloud/create-vm.ps1 -ComputerName $ComputerName -VMHost $VMHost -NetworkName $NetworkName -Datastore $Datastore -MemoryGB $MemoryGB -NumCpu $NumCpu -Template $Template -AdditionalDiskGB $AdditionalDiskGB -Start &} catch {}
        }
        else {
        try {docker run --rm -e ENV_VISERVER=$VIServer -e ENV_VISERVER_USER=$VIServerUser -e ENV_VISERVER_PASSWORD=$VIServerPassword $Container pwsh $Cloud/create-vm.ps1 -ComputerName $ComputerName -VMHost $VMHost -NetworkName $NetworkName -Datastore $Datastore -MemoryGB $MemoryGB -NumCpu $NumCpu -Template $Template -Start &} catch {}

        }
    }

    if ($Type -eq "clone") {
        try {docker run --rm -e ENV_VISERVER=$VIServer -e ENV_VISERVER_USER=$VIServerUser -e ENV_VISERVER_PASSWORD=$VIServerPassword $Container pwsh $Cloud/create-clone.ps1 -ComputerName $ComputerName -VMHost $VMHost -Datastore $Datastore -SnapshotVM $SnapshotVM -Snapshot $Snapshot &} catch {}
        
    }

}


#clear
cd ..
