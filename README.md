# Automate with ASAP
<img src="https://automatewithasap.com/assets/images/AutomateWithASAP.png" width="1000px"
## Deploy Faster. Deploy Better.
ASAP helps you deploy quickly and more efficiently. Whether you are building development environments in your home lab or full stacks in production, ASAP will help you deploy faster and better.

Under the hood, ASAP relies on trusted tools like Docker and PowerShell. ASAP works with Windows, MacOS and Linux.

## What is ASAP
ASAP is a set of tools written in PowerShell and delivered via Docker Hub and Github.

In order to maintain the integrity of the toolset across all platforms and avoid "It works on my computer. I'm not sure why it's not working on your computer." problem ASAP is deployed as a container via Docker Hub.

The ASAP container is controlled with a set of scripts that interact with Docker and can be dowloaded via Git at Github.

To run ASAP you will need Docker, PowerShell 7.0 Core, Git, access to a functional VMware vCenter deployment, and a VM template.

## Minimum Requirements
* [Docker](https://www.docker.com/get-started)
* [PowerShell 7.0 Core](https://github.com/PowerShell/PowerShell)
* [Git](https://git-scm.com/downloads)
* Access to a functional VMware vCenter deployment
* [VMware Templates](https://docs.vmware.com/en/VMware-vSphere/6.0/com.vmware.vsphere.hostclient.doc/GUID-846238E4-A1E3-4A28-B230-33BDD1D57454.html)
  * Get started quickly by converting an existing VM into a template

# Getting Started

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
    ./asap.ps1
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
* [Example Configuration Files](https://github.com/rickjacobo/asap/tree/main/configurations)
    
### Step 3
Choose ASAPs guided or cli experience
#### Guided
* Run ASAP
    ````
    ./asap.ps1
    ````
    or 
    ````
    ./asap.ps1 -Configuration ./configurations/<configuration-file.csv>
    ````


#### CLI
* Review Build File
    ````
    ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action review
    ````
* Edit Build File
    ````
    ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action edit
    ````
* Deploy Build (Requires -Force parameter)
    ````
    ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action deploy -Force
    ````
* Build Information
Use this command post deployment to get information related to your build.
    ````
    ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action information
    ````
* Destroy Build (Requires -Force parameter)
    ````
    ./asap.ps1 -Configuration ./configurations/<configuration-file.csv> -Action destroy -Force
    ````

