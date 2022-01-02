# asap

## Minimum Requirements
* [Docker](https://www.docker.com/get-started)
* [PowerShell 7.0 Core](https://github.com/PowerShell/PowerShell)
* [Git](https://git-scm.com/downloads)

## Download Bits
````
git clone https://github.com/rickjacobo/asap
````


## Usage
* Running ASAP without parameters allows for a guided user experience. 
* Adding parameters to ASAP will allow you to automate your builds.

### Step 1
Open PowerShell

### Step 2 
Begin by using ASAPs guided experience to create your first build configuration.
#### Create Configuration File
* Run ASAP
    ````
    pwsh ./asap.ps1
    ````
* Select option 1 to create a build file.
    * Choose Type
        * clone
        * template
    * Choose Build Name
* By default configurations are kept at <path to asap directory>/configurations
* Edit build configuration using either the guided or cli experience (See Step 3)

#### Configuration Notes
* Clone
    * Creates VM as a clone of an existing VM (VM requires snapshot)
* Template
    * Creates a VM from an existing template
#### Example Configurations
##### Clone Fields (Cloud = vmware)
* Type
    * [clone]
* Cloud
    * [vmware]
* ComputerName
    * [Computer Name] # Enter a computer name for the VM you will build
* VMHost
    * [VMHost Name] # Enter the VM Host here. This is a *wildcard* field and can contain a partial name to select the VM Host with the most resources available 
* Datastore
    * [Datastore Name] # Enter the name of the datastore you would like to use. This is a *wildcard* field and can contan a partial name to select the datastore with the most resources available
* SnapshotVM
    * [name of VM to clone] # This will be the name of an existing VM that you would like to use as the base for the VM you will build
* Snapshot
    * [name of VM Clone Snaptshot] # This will be the name of an existing snapshot of the SnapshotVM

##### Template (cloud = vmware)
* Type
    * [template]
* Cloud
    * [vmware]
* ComputerName
    * [Computer Name] # Enter a computer name for the VM you will build
* VMHost
    * [VMHost] # Enter the VM Host here. This is a *wildcard* field and can contain a partial name to select the VM Host with the most resources available 
* Datastore 
    * [Datastore] # Enter the name of the datastore you would like to use. This is a *wildcard* field and can contan a partial name to select the datastore with the most resources available
* NetworkName
    * [NetworkName] # Enter the name of the network you would like the VM to be a part of
* MemoryGB
    * [MemoryGB] # Enter the amount of memory that should be assigned to the VM
* NumCpu
    * [NumCpu] # Enter the number of CPUs that should be assigned to the VM
* Template
    * [Template] # Choose an existing template to base the VM off of.
* AdditionalDiskGB
    * [AdditionalDiskGB] # Optional. Leave blank for assign 0 to ignore this field during the build. Up to one additional disk can be added during the build.

### Step 3
Choose ASAPs guided or cli experience
#### Guided
* Run ASAP
    ````
    pwsh ./asap.ps1
    ````
    or 
    ````
    pwsh ./asap.ps1 -Configuration ./configurations/<configuration-file.csv>
    ````


#### CLI
* Review Build File
    ````
    pwsh ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action review
    ````
* Edit Build File
    ````
    pwsh ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action edit
    ````
* Deploy Build (Requires -Force parameter)
    ````
    pwsh ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action deploy -Force
    ````
* Build Information
Use this command post deployment to get information related to your build.
    ````
    pwsh ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action information
    ````
* Destroy Build (Requires -Force parameter)
    ````
    pwsh ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action destroy -Force
    ````

