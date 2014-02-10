The following describes the manual steps to create an Azure virtual machine with:

- Chocolatey
- Ctrl+V
- Visual Studio 2012
- Git for Windows
- GitHub for Windows

## Create the Virtual Machine

- https://manage.windowsazure.com/#Workspaces/VirtualMachineExtension/vms
- Click **+ New** at bottom left.
- Click **From Gallery**
- Select **Windows Server 2012 Datacenter**
- Complete the wizard with the following fields:
    - Virtual Machine Name: VS2012
    - Size: Large (4 cores, 7GB memory)

## ConfigureVM.bat

    @rem I've seen batch files that say don't use echo off so I'm being cautious and doing the same.
    
    @rem @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
    
    @echo.
    @echo.
    @echo Setting timezone to Canberra.
    tzutil.exe /s "AUS Eastern Standard Time"
    
    @echo.
    @echo.
    @echo Setting home location to Australia.
    @powershell -NoProfile -ExecutionPolicy unrestricted -Command "Set-WinHomeLocation 0xC"
    
    @echo.
    @echo.
    @echo Several applications will be installed with Chocolatey.bat.
    @call Chocolatey.bat
    
    @echo.
    @echo.
    @echo Chrome will not start to allow you to set it as default browser and pin to task bar.
    @echo.
    @pause
    
    "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
    
    @echo.
    @echo.
    @echo Visual Studio wil now start to allow you to register it and pin to task bar.
    @echo.
    @pause
    
    "C:\Program Files (x86)\Microsoft Visual Studio 11.0\Common7\IDE\VWDExpress.exe"
    
    @echo.
    @echo.
    @echo Finished configuring this Virtual Machine.
    @echo.
    @pause

## Chocolatey.bat

    call cinst wincommandpaste

    call cinst git
    todo: cannot be run now because git not in path. must close and reopen cmd call cinst git-credential-winstore

    call cinst notepad2-mod
    
    call cinst VisualStudioExpress2012Web
    call cinst Dogtail.VS2012.3
    call cinst Dogtail.VisualStudioToolsforGit
    
    call cinst Firefox
    rem todo call cinst Safari 
    call cinst GoogleChrome

## Git

    git config --global user.name "Tim Murphy"
    git config --global user.email "tim@26tp.com"

## Visual Studio 2012

Options > Source Control > Set as Microsoft Git Provider.

todo: might not be needed becuase we now install Git for Windows
View > Team Explorer > Setting
- Git
- Install 3rd-party tools

