$ErrorActionPreference = "Stop"

$vmRam = 2gb
$vmName = "Build Server"
$switchName = "D-Link DWA-556 Xtreme N PCIe Desktop Adapter Virtual Switch"
$vhdPath = "D:\Hyper-V\Virtual Hard Disks\Build Server.vhdx"
$vhdSize = 127GB
$generation = 2
$isoPath = "D:\Setup\Windows 8 Upgrade as ISO\Windows-8-Upgrade.iso"

# todo: automate.
$vmExists = $true

if ($vmExists)
{
    Write-Host
    Write-Host "Removing existing $vmName VM..."
    Remove-VM -Name $vmName -Force
}

if (Test-Path $vhdPath)
{
    Write-Host
    Write-Host "Removing existing $vhdPath VHD..."
    Remove-Item $vhdPath
}

Write-Host
Write-Host "Creating $vmName VM..."
New-VM -BootDevice CD -MemoryStartupBytes $vmRam -Name $vmName -SwitchName $switchName -NewVHDPath $vhdPath -NewVHDSizeBytes $vhdSize -Generation $generation

Write-Host
Write-Host "Setting $vmName image..."
Set-VMDvdDrive -VMName $vmName -Path $isoPath 

Write-Host
Write-Host "Finished!"
Write-Host
