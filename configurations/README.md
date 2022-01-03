## Configuration Files
### Example Configurations
* [Example CSV Files](https://github.com/rickjacobo/asap/tree/main/configurations)
#### Clone Fields (Cloud = vmware)
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

#### Template Fields (cloud = vmware)
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
