param (
    [parameter(mandatory=$true,position=1)]
    $Type,
    [parameter(mandatory=$true,position=2)]
    $Filename
)
#Requires -Version 7.0
#Requires -PSEdition Core
$CurrentDir = ${pwd}
cd $PSScriptRoot

$Filename = "$Filename" + ".csv"

if ($Type -eq "template"){
$Configuration = "Type,Cloud,ComputerName,VMHost,Datastore,NetworkName,MemoryGB,NumCpu,Template,AdditionalDiskGB
template,,,,,,,,,"
}
if ($Type -eq "clone"){
$Configuration = "Type,Cloud,ComputerName,VMHost,Datastore,SnapshotVM,Snapshot
clone,,,,,,"
}
$Configuration | Out-File ../configurations/$Filename

cd $CurrentDir
