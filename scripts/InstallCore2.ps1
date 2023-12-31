Start-Transcript -Path "C:\Temp\Core\InstallCoreErrors2.txt" -IncludeInvocationHeader

try 
{
#your script

Stop-Process -ProcessName explorer
explorer shell:AppsFolder

devmgmt.msc
systeminfo | Out-File -FilePath C:\Temp\Core\systeminfo.txt
Get-ComputerInfo | Out-File -FilePath C:\Temp\Core\Get-ComputerInfo.txt
& "C:\Program Files\7-Zip\7zFM.exe"

Start-Process ms-windows-store:
explorer ms-windows-store:
#explorer ms-appinstaller:?source=https://aka.ms/getwinget
#Start-Process iexplore ms-appinstaller:?source=https://aka.ms/getwinget
#Start-Process microsoft-edge:https://github-releases.githubusercontent.com/197275130/dd04bc80-d294-11eb-921d-e0f9a5ebe452?X-Amz-Algorithm=AWS4-HMAC-SHA256"&"X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20210915%2Fus-east-1%2Fs3%2Faws4_request"&"X-Amz-Date=20210915T135811Z"&"X-Amz-Expires=300"&"X-Amz-Signature=3baa6df7aa8cf546b032987373e13b3e650456b79566441ba5a78f144935c5ac"&"X-Amz-SignedHeaders=host"&"actor_id=0"&"key_id=0"&"repo_id=197275130"&"response-content-disposition=attachment%3B%20filename%3DMicrosoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"&"response-content-type=application%2Foctet-stream

}

catch
{
  #perform action or write specific error
  continue;
}

Stop-Transcript

function Analyze( $p, $f) {

  Get-ItemProperty $p |ForEach-Object {
  
  if (($_.DisplayName) -or ($_.version)) {
  
  [PSCustomObject]@{
  
  From = $f;
  
  Name = $_.DisplayName;
  
  Version = $_.DisplayVersion;
  
  Install = $_.InstallDate
  
  }
  
  }
  
  }
  
  }
  
  $s = @()
  
  $s += Analyze 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' 64
  
  $s += Analyze 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' 32
  
  $s | Sort-Object -Property Name |Export-Csv C:\Temp\InstalledPrograms_$(Get-Content env:computername).csv


Get-Content "C:\Temp\Core\InstallCoreErrors1.txt" | Out-GridView -PassThru -Title "LOG"
Get-Content "C:\Temp\Core\InstallCoreErrors2.txt" | Out-GridView -PassThru -Title "LOG"

dism /online /enable-feature /featurename:netfx3 /all
dism /online /enable-feature /featurename:WCF-HTTP-Activation /all
dism /online /enable-feature /featurename:WCF-NonHTTP-Activation /all

appwiz.cpl

Write-Progress -Activity 'Checking Windows Update' -PercentComplete (100/10 * 10)
powershell.exe -File C:\Temp\Core\Scripts\CheckAndInstallWU.ps1
