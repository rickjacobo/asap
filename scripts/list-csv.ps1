#Requires -Version 7.0
#Requires -PSEdition Core

cd $PSScriptRoot

$ConfigurationDir = "../configurations/"

clear
Write-Host " "

$global:i = 1; Dir $ConfigurationDir | where name -like "*.csv" | Select Name, BaseName, FullName, @{n="Id";e={$global:i.ToString("0"); $global:i += 1}} | Foreach {
    $Id = $_.Id + "."
    $Name = $_.BaseName
    Write-Host "$Id $Name"
}

$ReadHost = Read-host "
Please enter a selection"

$global:i = 1; Dir $ConfigurationDir | where name -like "*.csv" | Select Name, BaseName, FullName, @{n="Id";e={$global:i.ToString("0"); $global:i += 1}} | Where Id -eq $ReadHost | foreach {
    $Configuration = $_.FullName
    ../asap.ps1 $Configuration
}
