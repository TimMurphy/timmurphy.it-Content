- Add Affinity Group
    - Name: timmurphy
    - Region: West US
- New Storage Account
    - URL: timmurphy
    - Affinity Group: timmurphy
    - Replication: Geo-Redundant
- New Cloud Service
    - Quick Create
    - URL: timmurphy
    - Affinity Group: timmurphy
- New Virtual Machine
    - From Gallery so Storage Account can be select
    - Image: Windows Server 2012 R2 Datacenter
    - Version Release Date: 10/28/2014
    - Virtual Machine Name: timmurphy
    - Tier: Basic
    - Size: Initially A3
    - User Name: timmurphy
    - Password: ****
    - Cloud Service: timmurphy
    - Affinity Group: timmurphy
    - Storage Account: timmurphy
    - Availability Set: Create an availabilty set
    - Availability Set Name: timmurphy
    - Endpoints
        - Used defaults
            - Remote Desktop, TCP, AUTO, 3389
            - PowerShell, TCP, 5986, 5986
        - Add
            - HTTP
    - Virtual Machine Configuration page
        - Select Install the VM Agent.
        - Everything else was unselected by default.
- Attach an empty disk to the virtual machine
    - File Name: timmurphy-vm-attached-disk
    - Size (GB): 1023
    - Host Cache Preference: None
- Connect (Use Connect icon to get Remote Desktop shortcut)
    - Customize the mouse buttons
    - powershell -NoProfile -ExecutionPolicy unrestricted -Command "Set-ExecutionPolicy Unrestricted"
    - powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin
    - New Admin Command Prompt
    - choco install Boxstarter
    - New Admin Command Prompt
    - timmurphy-azure-vm-01.bat
    - Windows Update
        - Run
        - Configure
            - Select "Give me recommended updates the same way I receive important updates"
    - Server Manager\File and Storage Services\Volumes\Disks
        - Create new with storage disk we attached earlier
            - Drive Letter: F
            - Volume Label: timmurphy-vm-attached-disk
    - PowerShell command prompt
        - winrm quickconfig
        - CD C:\Configuration\iis
        - .\NewWebsite.ps1
        
## Custom Domain with GoDaddy

- [Domains](https://dcc.godaddy.com/dcc50/default.aspx?sa=&marketid=en-AU&regionsite=au)
    - CNAME
        - www to timmurphy.cloudapp.net
    - A
        - to ip addresss
    - Naked
        - todo
    
## todo

- Scripts
    - Create desktop shortcut for Windows Update.
    - Pin notepad2 to Task Bar.
    - Windows Explorer
        - Expand all folders
        
        