#Remove OneDrive
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Microsoft OneDrive"} | foreach-object -process {$_.Uninstall()}
