You must create a Virtual Network before you create a Virtual Machine. The following Azure page will guide you through creating the Virtual Machine. The rest of this post will guide you through what to do after that.

- [Add a Virtual Machine to a Virtual Network](http://www.windowsazure.com/en-us/manage/services/networking/add-a-vm-to-a-virtual-network/)

Now the Virtual Machine has been created:

- Select
- Connect

## Remote Desktop

As with all new machines (virtual or real) I like to run Windows Update until there are no more updates.

While Windows Update is running you can continue with the rest of the post.

## Configure Endpoints

- Windows Azure Portal
- Select Virtual Machine
- Select ENDPOINTS (near top middle of page)
- Add Standalone Endpoint
- Select HTTP

## Remote Desktop

Return to remote desktop and finish off Windows Update.

### ConfigureVM.bat

    @rem I've seen batch files that say don't use echo off so I'm being cautious and doing the same.
    
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
    @echo Finished configuring this Virtual Machine.
    @echo.
    @pause

### Web Server

Use Server Manager Dashboard to add Web Server (IIS)

Accept the defaults but on the last page tick **Restart the destination server automatically if required**.

Windows Update. (todo: get command line)

Check the installation by opening the following in IE on your VM"

- http://localhost/
- http://MyCloudService.cloudapp.net/

## Configure DNS

Check the address you require via your browser. e.g. MyCloudService.cloudapp.net

Add CNAME for www.mydomain.com to point to mycloudservice.cloudapp.net

For A record ping mycloudservice.cloudapp.net to get IP address.

### godaddy DNS

- Sign in.
- Click My Account (top left).
- Launch My Domains.
- Click domain you want to configure.
 
#### Change www CNAME

- Click DNS Zone File tab.
- Click Edit.
- Edit the exiting CNAME www. Change @ to your VM addresss. e.g. MyCloudService.cloudapp.net
 
#### Change A (host)

- Edit A (host) and change IP address.
 
#### Forward root domain

http://candordeveloper.com/2013/04/16/how-to-forward-a-godaddy-domain-to-azure/ say this is required. I'm trying without it.

## References

- [stackoverflow.com - Windows Azure VM Website setup](http://stackoverflow.com/questions/11074088/windows-azure-vm-website-setup)
- [HOW TO FORWARD A GODADDY DOMAIN TO AZURE)(http://candordeveloper.com/2013/04/16/how-to-forward-a-godaddy-domain-to-azure/)
