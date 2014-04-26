# How to clear disk space on Windows 8

The following suggestions is in order to most likely to clear space the most space to least space.

## Clear Temp folder

	rd /q /s %temp%
	md %temp%
	rd /q /s %tmp%
	md %tmp%

## Run Disk Cleanup 

	%windir%\System32\cleanmgr.exe

Ensure you use click the More options... button to clear System Restore 

## Clear Browser Cache

To date I don't have a command line here. The steps vary from browser to browser but you'll usually find a clear cache option under the browser's settings.

## References

- [Guide to Freeing up Disk Space under Windows 7](http://www.hanselman.com/blog/GuideToFreeingUpDiskSpaceUnderWindows7.aspx "Guide to Freeing up Disk Space under Windows 7") by Scott Hanselman