Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Dell Digital Delivery"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Dell Mobile Connect Drivers"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Dell SupportAssist"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Dell SupportAssist Remediation"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Dell Update - SupportAssist Update Plugin"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Dell Update for Windows 10"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "McAfee WebAdvisor"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "McAfee LiveSafe"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "SmartByte Drivers and Services"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Avira"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Ajuda e Suporte da Dell"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Dell Customer Connect"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Dell Update"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Registro de Produto Dell"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Vulkan Run Time Libraries 1.0.11.1"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Vulkan Run Time Libraries 1.0.33.0"} | foreach-object -process {$_.Uninstall()}
Get-WmiObject -Class Win32_Product | Where-Object {$_.Name -eq "Vulkan Run Time Libraries 1.0.54.1"} | foreach-object -process {$_.Uninstall()}
