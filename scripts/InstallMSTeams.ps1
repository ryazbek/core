Set-ExecutionPolicy Unrestricted -Force
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Teams Machine-Wide Installer"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Microsoft Teams"} | foreach-object -process {$_.Uninstall()}

Write-Progress -Activity 'Getting Microsoft Teams' -PercentComplete (100/10 * 1)
New-Item -Type Directory -Path "C:\Temp\Core\Programs\Microsoft Office\" -Force
[system.Diagnostics.Process]::Start("chrome.exe","https://statics.teams.cdn.office.net/production-windows/1.6.00.12455/TeamsSetup.exe")
Sleep 15
Move-Item "$env:userprofile\Downloads\TeamsSetup.exe" "C:\Temp\Core\Programs\Microsoft Office\"
& "C:\Temp\Core\Programs\Microsoft Office\TeamsSetup.exe"
#https://teams.microsoft.com/downloads/desktopurl?env=production&plat=windows&arch=x64&managedInstaller=true&download=true
