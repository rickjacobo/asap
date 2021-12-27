param (
    [parameter(mandatory=$false,position=1)]
    $Configuration
)
#Requires -Version 7.0
#Requires -PSEdition Core

$CurrentDir = ${pwd}
cd $PSScriptRoot

$Container = "rickjacobo/asap:latest"

if (Test-Path -Path ../.env){}
else {./set-environmentvariables.ps1}
$EnviornmentVariables = Get-Content ../.env | ConvertFrom-Json
$VIServer = $EnviornmentVariables.VIServer
$VIServerUser = $EnviornmentVariables.VIServerUser
$VIServerPassword = $EnviornmentVariables.VIServerPassword

$Cloud = (import-csv $Configuration | select Cloud -First 1).Cloud
$Information = try {docker run --rm -e ENV_VISERVER=$VIServer -e ENV_VISERVER_USER=$VIServerUser -e ENV_VISERVER_PASSWORD=$VIServerPassword $Container pwsh $Cloud/get-information.ps1 | ConvertFrom-Json | Sort-Object Name} catch {}
$CSVImport = Import-CSV $Configuration | sort-object ComputerName
$CSVImport | Foreach {
    $ComputerName = $_.ComputerName
    $Information | Where {$_.Name -eq "$ComputerName"}
}

cd $CurrentDir
