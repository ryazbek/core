Set-ExecutionPolicy Unrestricted -Force
Write-Progress -Activity 'Installing DWGTrueViewer' -PercentComplete (100/10 * 1)
New-Item -Type Directory -Path "C:\Temp\Core\Programs\DWGTrueViewer\" -Force
[system.Diagnostics.Process]::Start("iexplore.exe","https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/530BA89C-90A7-30BF-A36E-DFD00B7311E7/SFX/DWGTrueView_2023_English_64bit_dlm.sfx.exe?authparam=b91ba1b191a933c9c10b81c98913132b812b1b811b991b3389b98913a1c933b9&SESSION_ID=123456789;1160320248;2438254168;1;authparam;SESSION_ID/DWGTrueView_2023_English_64bit_dlm.sfx.exe")
Sleep 60
Move-Item "$env:userprofile\Downloads\DWGTrueView_2023_English_64bit_dlm.sfx.exe" "C:\Temp\Core\Programs\DWGTrueViewer\"
& "C:\Temp\Core\Programs\DWGTrueViewer\DWGTrueView_2023_English_64bit_dlm.sfx.exe"
# https://efulfillment.autodesk.com/NetSWDLD/2023/ACD/530BA89C-90A7-30BF-A36E-DFD00B7311E7/SFX/DWGTrueView_2023_English_64bit_dlm.sfx.exe?authparam=b91ba1b191a933c9c10b81c98913132b812b1b811b991b3389b98913a1c933b9&SESSION_ID=123456789;1160320248;2438254168;1;authparam;SESSION_ID


