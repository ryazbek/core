Measure-Command {
Start-Transcript -Path "C:\Temp\Core\InstallCoreErrors.txt" -IncludeInvocationHeader
powershell.exe -Command "& {Set-ExecutionPolicy -scope Currentuser -executionPolicy Unrestricted}"

function Check-Admin {

param([switch]$Elevated)

$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())

$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

}

if ((Check-Admin) -eq $false) {

if ($elevated)

{

# could not elevate, quit

}

else {

Start-Process powershell.exe -Verb RunAs -ArgumentList (‘-noprofile -noexit -file “{0}” -elevated’ -f ($myinvocation.MyCommand.Definition))

}

exit

}

Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Microsoft Update Health Tools"} | foreach-object -process {$_.Uninstall()}

Write-Progress -Activity 'Now configuring your Power Plan' -PercentComplete (100/10 * 1)
powershell.exe -File C:\Temp\Core\Scripts\PowerCFG.ps1

Write-Progress -Activity 'Installing AV ESET' -PercentComplete (100/10 * 3)
powershell.exe -File C:\Temp\Core\Scripts\InstallAVESET.ps1

Write-Progress -Activity 'Installing AnyDesk' -PercentComplete (100/10 * 2)
powershell.exe -File C:\Temp\Core\Scripts\InstallAnyDesk.ps1

Write-Progress -Activity 'Installing IPMon' -PercentComplete (100/10 * 2)
powershell.exe -File C:\Temp\Core\Scripts\InstallIPMon.ps1

Write-Progress -Activity 'ADD REG Values' -PercentComplete (100/10 * 4)
powershell.exe -File C:\Temp\Core\Scripts\ADDREGValues.ps1

Write-Progress -Activity 'Disabling UAC' -PercentComplete (100/10 * 4)
powershell.exe -File C:\Temp\Core\Scripts\DisableUAC.ps1

Write-Progress -Activity 'Disabling FeaturesServices' -PercentComplete (100/10 * 5)
powershell.exe -File C:\Temp\Core\Scripts\DisableFeaturesServices.ps1

Write-Progress -Activity 'Disabling BackgroundApplicationsW10' -PercentComplete (100/10 * 5)
powershell.exe -File C:\Temp\Core\Scripts\DisableBackgroundApplications.ps1

Write-Progress -Activity 'Disabling AntiSpyware' -PercentComplete (100/10 * 6)
powershell.exe -File C:\Temp\Core\Scripts\DisableAntiSpyware.ps1

Write-Progress -Activity 'Removing Windows Built-In Apps... please wait...' -PercentComplete (100/10 * 6)
powershell.exe -File C:\Temp\Core\Scripts\RemoveWBuiltInApps.ps1

Write-Progress -Activity 'Enabling PSRemoting' -PercentComplete (100/10 * 8)
powershell.exe -File C:\Temp\Core\Scripts\EnablePSRemoting.ps1

Write-Progress -Activity 'Disabling Network IPv6 all Interfaces' -PercentComplete (100/10 * 6)
powershell.exe -File C:\Temp\Core\Scripts\DisableNetworkIPv6.ps1

Write-Progress -Activity 'Enabling Network Discovery' -PercentComplete (100/10 * 7)
powershell.exe -File C:\Temp\Core\Scripts\EnableNetworkDiscovery.ps1

Write-Progress -Activity 'Enabling RDP' -PercentComplete (100/10 * 7)
powershell.exe -File C:\Temp\Core\Scripts\EnableRDP.ps1

Write-Progress -Activity 'Installing Chocolatey' -PercentComplete (100/10 * 9)
powershell.exe -File C:\Temp\Core\Scripts\InstallChocolatey.ps1

refreshenv

Write-Progress -Activity 'Installing Chocolatey Apps' -PercentComplete (100/10 * 9)
& "$PSScriptRoot\InstallChocolateyApps.ps1"

Write-Progress -Activity 'Installing Microsoft 365' -PercentComplete (100/10 * 8)
powershell.exe -File C:\Temp\Core\Scripts\InstallM365.ps1

Write-Progress -Activity 'Installing Install Support Assist Dell' -PercentComplete (100/10 * 8)
powershell.exe -File C:\Temp\Core\Scripts\InstallSupportAssistDell.ps1

Write-Progress -Activity 'Installing Install Support Assist Intel' -PercentComplete (100/10 * 8)
powershell.exe -File C:\Temp\Core\Scripts\InstallSupportAssistIntel.ps1

#Some features
dism /online /enable-feature /featurename:netfx3 /all
dism /online /enable-feature /featurename:WCF-HTTP-Activation /all
dism /online /enable-feature /featurename:WCF-NonHTTP-Activation /all

Write-Progress -Activity 'Installing Microsoft 365' -PercentComplete (100/10 * 8)
powershell.exe -File C:\Temp\Core\Scripts\InstallMSTeams.ps1

Write-Progress -Activity 'Getting Installed Programs' -PercentComplete (100/10 * 8)
powershell.exe -File C:\Temp\Core\Scripts\InstalledPrograms.ps1

Get-Content "C:\Temp\Core\InstallCoreErrors.txt" | Out-GridView -PassThru -Title "LOG"

Write-Progress -Activity 'Installing Install Support Assist Intel' -PercentComplete (100/10 * 8)
powershell.exe -File C:\Temp\Core\Scripts\InstallTeamViewer.ps1

explorer shell:AppsFolder
appwiz.cpl
devmgmt.msc
systeminfo | Out-File -FilePath C:\Temp\Core\systeminfo.txt
Get-ComputerInfo | Out-File -FilePath C:\Temp\Core\Get-ComputerInfo.txt
& "C:\Program Files\7-Zip\7zFM.exe"
& "C:\Program Files\Adobe\Acrobat DC\Acrobat\Acrobat.exe"

Start-Process ms-windows-store:
explorer ms-windows-store:

Stop-Transcript
}
Write-Progress -Activity 'Checking Windows Update' -PercentComplete (100/10 * 10)
powershell.exe -File C:\Temp\Core\Scripts\CheckAndInstallWU.ps1
