Set-ExecutionPolicy Unrestricted -Force
Write-Progress -Activity 'Getting IPMon' -PercentComplete (100/10 * 1)
New-Item -Type Directory -Path "C:\Temp\Core\Programs\Tools\IPMon\" -Force
Invoke-WebRequest 'https://softjem.com.br/gtfl/AgtInstall.exe' -OutFile 'C:\Temp\Core\Programs\Tools\IPMon\AgtInstall.exe'
Sleep 15
& "C:\Temp\Core\Programs\Tools\IPMon\AgtInstall.exe"
