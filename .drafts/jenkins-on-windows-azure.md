The following describes the manual steps to create an Windows Azure virtual machine. Eventually I will convert this
to be run entirely by scripts.

## Create the Virtual Machine

- https://manage.windowsazure.com/#Workspaces/VirtualMachineExtension/vms
- Click **+ New** at bottom left.
- Click **From Gallery**
- Select **Windows Server 2012 Datacenter**
- Complete the wizard with the following fields:
    - Virtual Machine Name: Jenkin
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

    @call cinst wincommandpaste

    @call cinst git
    rem todo: cannot be run now because git not in path. must close and reopen cmd call cinst git-credential-winstore

    @call cinst notepad2-mod
    
    @call cinst Firefox
    rem todo call cinst Safari 
    @call cinst GoogleChrome

    @call cinst VisualStudio2012Professional
    @call cinst Dogtail.VisualStudio2012Ultimate

    @call cinst winsplit
    
## WinSplit

Start and configure to start with windows.

## clone-croquetscores.com.bat

	@echo off
	
	echo.
	echo.
	echo Initial cloning of croquetscores.com...
	echo.
	
	if not exist ..\Code\nul (
	
		echo Creating ..\Code folder...
		md ..\Code
		echo.
		
	)
	
	if exist ..\Code\croquetscores.com\nul (
	
		echo croquetscores.com already exists.
		goto End
		
	)
	
	echo Cloning repository...
	git clone https://timmurphy@bitbucket.org/croquetscores/croquetscores.com.git ..\Code\croquetscores.com
	echo.
	
	echo Checking out Commentary branch...
	pushd ..\Code\croquetscores.com
	git checkout Commentary
	popd
	if not "%errorlevel%" == "0" goto Error 
	echo.
	
	echo Success!
	goto End
	
	:Error
	echo.
	echo. ERROR ERROR ERROR ERROR ERROR ERROR ERROR 
	echo.
	
	:End
	echo.
	pause
