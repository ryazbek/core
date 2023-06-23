Set-ExecutionPolicy Unrestricted -Force
Write-Progress -Activity 'Installing Intel RST' -PercentComplete (100/10 * 1)
New-Item -Type Directory -Path "C:\Temp\Core\Drivers\Intel\" -Force
#Copy-Item "D:\SetupRST.exe" "C:\Temp\Core\Drivers\Intel\"
Invoke-WebRequest -Uri "https://downloadmirror.intel.com/751275/SetupRST.exe" -OutFile "C:\Temp\Core\Drivers\Intel\SetupRST.exe"
& "C:\Temp\Core\Drivers\Intel\SetupRST.exe" -silent -accepteula
# https://www.intel.com.br/content/www/br/pt/support/articles/000057787/memory-and-storage/intel-optane-memory.html
