# WMI Object
$installeddimms = ((Get-WmiObject -class "win32_physicalmemory") | Measure-Object).Count
$availabledimms = Get-WmiObject -Class "win32_PhysicalMemoryArray" | select -ExpandProperty MemoryDevices
Write-Output "Installed: $installeddimms / Max: $availabledimms"

# CIMInstance
$installeddimms = ((Get-CimInstance -class "CIM_physicalmemory") | Measure-Object).Count
$availabledimms = Get-CimInstance -Class "win32_PhysicalMemoryArray" | select -ExpandProperty MemoryDevices
Write-Output "Installed: $installeddimms / Max: $availabledimms"


Get-CimInstance CIM_PhysicalMemory | Select-Object BankLabel, Manufacturer, Description , @{n = 'SizeGB'; e = { $_.Capacity / 1GB } }, MemoryType, @{n = 'MemoryDef'; e = { $MemHash[$_.MemoryType] } } | Format-Table