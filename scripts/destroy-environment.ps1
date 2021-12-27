param (
    [parameter(mandatory=$true,position=1)]
    $Configuration,
    [Switch]$Force
)
#Requires -Version 7.0
#Requires -PSEdition Core
cd $PSScriptRoot


$Container = "rickjacobo/asap:latest"

if ($Force){
cd $PSScriptRoot
if (Test-Path -Path ../.env){}
else {./set-environmentvariables.ps1}
$EnvironmentVariables = Get-Content ../.env | ConvertFrom-Json
$VIServer = $EnvironmentVariables.VIServer
$VIServerUser = $EnvironmentVariables.VIServerUser
$VIServerPassword = $EnvironmentVariables.VIServerPassword

$CSVImport = Import-CSV $Configuration
$CSVImport | Foreach {
    $ComputerName = $_.ComputerName
    $Cloud = $_.Cloud
    try {docker run --rm -e ENV_VISERVER=$VIServer -e ENV_VISERVER_USER=$VIServerUser -e ENV_VISERVER_PASSWORD=$VIServerPassword $Container pwsh $Cloud/destroy-vm.ps1 -ComputerName $ComputerName &} catch {}
    }
}

else {
./review-configuration.ps1 -Configuration $Configuration -Force

$ReadHost = Read-Host 'Type "DESTROY" to Destroy Environment or "CTRL + C" to abort'

if ($ReadHost -ne "DESTROY") {}
else {
cd $PSScriptRoot
if (Test-Path -Path ../.env){}
else {./set-environmentvariables.ps1}
$EnvironmentVariables = Get-Content ../.env | ConvertFrom-Json
$VIServer = $EnvironmentVariables.VIServer
$VIServerUser = $EnvironmentVariables.VIServerUser
$VIServerPassword = $EnvironmentVariables.VIServerPassword

$CSVImport = Import-CSV $Configuration
$CSVImport | Foreach {
    $ComputerName = $_.ComputerName
    $Cloud = $_.Cloud
    try {docker run --rm -e ENV_VISERVER=$VIServer -e ENV_VISERVER_USER=$VIServerUser -e ENV_VISERVER_PASSWORD=$VIServerPassword $Container pwsh $Cloud/destroy-vm.ps1 -ComputerName $ComputerName &} catch {}
    }
}

}

cd ..
