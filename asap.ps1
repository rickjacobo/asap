param (
    [parameter(mandatory=$false,position=1)]
    $Configuration,
    [parameter(mandatory=$false,position=2)]
    $Action,
    [Switch]$Force




)
#Requires -Version 7.0
#Requires -PSEdition Core
cd $PSScriptRoot
If ($Configuration) {
$Configuration = Dir $Configuration | select fullname
$Configuration = $Configuration.FullName

if ($Action) {
    if (($Action -eq "Review") -or ($Action -eq "review")) {$Action = 1; $Selection = $Action}
    if (($Action -eq "Edit") -or ($Action -eq "edit")) {$Action = 2; $Selection = $Action}

    if ( (($Action -eq "Deploy") -and ($Force)) -or (($Action -eq "deploy") -and ($Force)) ) {./scripts/deploy-environment.ps1 -Configuration $Configuration -Force}
    if ( (($Action -eq "Deploy") -and (!$Force)) -or (($Action -eq "deploy") -and (!$Force)) ) {Write-Host 'Add "-Force" parameter to deploy' }
    
    if (($Action -eq "Information") -or ($Action -eq "information")) {$Action = 4; $Selection = $Action}
    
    if ( (($Action -eq "Destroy") -and ($Force)) -or (($Action -eq "destroy") -and ($Force)) ) {./scripts/destroy-environment.ps1 -Configuration $Configuration -Force}
    if ( (($Action -eq "Destroy") -and (!$Force)) -or (($Action -eq "destroy") -and (!$Force)) ) {Write-Host 'Add "-Force" parameter to destroy' }
}

else {
$Selection = Read-Host "
1. Review Configuration
2. Edit Configuration
3. Deploy Environment
4. Get Environment Information
5. Destroy Environment

Please select an option"
}
If ($Selection -eq "1"){
    ./scripts/review-configuration.ps1 -Configuration $Configuration -Force
}
If ($Selection -eq "2"){
    ./scripts/edit-configuration.ps1 -Configuration $Configuration
}
If ($Selection -eq "3"){
    ./scripts/deploy-environment.ps1 -Configuration $Configuration
}
If ($Selection -eq "4"){
    ./scripts/get-information.ps1 -Configuration $Configuration
}
If ($Selection -eq "5"){
    ./scripts/destroy-environment.ps1 -Configuration $Configuration
}
}


else {$Selection = Read-Host "
1. Create Build File
2. Select Existing Build File

Please select an option"
If ($Selection -eq "1"){
    ./scripts/create-csv.ps1
}
If ($Selection -eq "2") {
    ./scripts/list-csv.ps1
}
}
    
