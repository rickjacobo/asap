#Requires -Version 7.0
#Requires -PSEdition Core

$CurrentDir = ${pwd}
cd $PSScriptRoot

Write-Host "Environment Configuration"
$VIServer = (Read-Host "Enter VIServer")
$VIServerUser = (Read-Host "Enter VIServer Username")
$VIServerPass = (Read-Host "Enter VIServer Password")
$Configuration = @"
{
    "VIserver": "$VIServer",
    "VIServerUser": "$VIServerUser",
    "VIServerPassword": "$ViServerPass"
}
"@
$Configuration | Out-File ../.env
cd $CurrentDir
