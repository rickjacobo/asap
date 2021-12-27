param(
    [parameter(mandatory=$true,position=1)]
    $Configuration,
    [Switch]$Force
)
#Requires -Version 7.0
#Requires -PSEdition Core

Import-Csv $Configuration

if ($Force){}
else {
Read-Host 'Hit "Enter" to Continue or "CTRL + C" to Quit'
}

