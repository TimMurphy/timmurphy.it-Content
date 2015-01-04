## Command prompt

cd\Websites
CreateWebSite UserName example.com

### CreateWebSite.bat

    @echo Usage:
    @echo.
    @echo    CreateWebSite UserName example.com
    @echo.
    @echo todo:
    @echo   - arg validation
    @echo   - directory validation
    @echo   - appcmd error level.
    
    
    md C:\Websites\%1
    md C:\Websites\%1\%2
    
    %systemroot%\system32\inetsrv\appcmd add site /name:%2 /physicalPath:C:\Websites\%1\%2 /bindings:http://%2:80,http://www.%2:80
    
    rem todo: install index.html

## References

- http://technet.microsoft.com/en-us/library/hh831515.aspx
- http://www.iis.net/learn/get-started/getting-started-with-iis/getting-started-with-appcmdexe
