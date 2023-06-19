Set-ExecutionPolicy Unrestricted -Force
[system.Diagnostics.Process]::Start("iexplore","https://dl.dell.com/serviceability/eSupport/SupportAssistLauncher.exe")
New-Item -Type directory -path "C:\Temp\Core\Drivers\Dell\" -Force
Start-Sleep 15
Copy-Item "$env:userprofile\Downloads\SupportAssistLauncher.exe" "C:\Temp\Core\Drivers\Dell\"
& 'C:\Temp\Core\Drivers\Dell\SupportAssistLauncher.exe'
Write-Progress -Activity 'Installing Dell SupportAssist' -PercentComplete (100/10 * 9)
Start-Process microsoft-edge:https://www.dell.com/support/home/pt-br/product-support/servicetag
#Start-Process chrome.exe https://www.dell.com/support/home/pt-br/product-support/servicetag
