# How to Create Windows 10 Techical Preview Hyper-V Virtual Machine

## GUI Version

- Open Hyper-V Manager
- In the left panel right-click on your machine name. Your machine is usually the first item under **Hyper-V Manager**.
- Click New
- Click Virtual Machine
- Change the default values as required. My changes are:
    - Specify Name and Location: you might have more than one virtual machine so enter an appropiate name.
    - Specify Generation: I choice generation 2 simply because its newer. However there are limitations on which Operating System.
    - Assign Memory: I usually selected 2048 MB so I get a workable machine.
    - Configure Networking: Select your network adapter.
    - Connect Virtual Hard Disk: The VHD size on host system will only be as large as it needs to be so you can safely set a large size.
    - Installation Option: I set the installation ISO image.
    
## Command Line Version

todo

## Windows 10 Technical Perview Installation

- Select **Custom: Install Windows only (advanced)**.

## todo

- Does host PC (my PC) require a fixed ip address for internet access to work in Virtual Machine???
- How to have 2 VMs running and have networking in VM work.