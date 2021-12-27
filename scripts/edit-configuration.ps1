param (
    [parameter(mandatory=$true,position=1)]
    $Configuration
)
#Requires -Version 7.0
#Requires -PSEdition Core

$CurrentDir = ${PWD}
cd $PSScriptRoot

if (($IsLinux) -or ($IsMacOs)) {
    vi $Configuration
}
if ($IsWindows) {
    notepad $Configuration
}

cd $CurrentDir
