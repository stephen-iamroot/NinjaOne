# WMI Object
$installeddimms = ((Get-WmiObject -class "win32_physicalmemory") | Measure-Object).Count
$availabledimms = Get-WmiObject -Class "win32_PhysicalMemoryArray" | select -ExpandProperty MemoryDevices
Write-Output "Installed: $installeddimms / Max: $availabledimms"

# CIMInstance
$installeddimms = ((Get-CimInstance -class "CIM_physicalmemory") | Measure-Object).Count
$availabledimms = Get-CimInstance -Class "win32_PhysicalMemoryArray" | select -ExpandProperty MemoryDevices
Write-Output "Installed: $installeddimms / Max: $availabledimms"


Get-CimInstance CIM_PhysicalMemory | Select-Object BankLabel, Manufacturer, Description , @{n = 'SizeGB'; e = { $_.Capacity / 1GB } }, MemoryType, @{n = 'MemoryDef'; e = { $MemHash[$_.MemoryType] } } | Format-Table



$info = 
    $colSlots = Get-CimInstance -ClassName "win32_PhysicalMemoryArray" -namespace "root\CIMV2"
    $colRAM = Get-CimInstance -ClassName "win32_PhysicalMemory" -namespace "root\CIMV2"
  
    if ($colSlots -and $colRAM) {
          foreach ($stick in ($colram | where capacity -ne '*' | select DeviceLocator, capacity -First ($colram.count - 1))) {
            [PSCustomObject]@{
                Hostname          = $computer
                Total_Slots       = $($slots = $null; $colSlots.MemoryDevices | foreach {$slots += $_}; $slots - 1)
                Slots_Populated   = $colram.count - 1
                Empty_Slots       = $($slots = $null; $colSlots.MemoryDevices | foreach {$slots += $_}; $slots - 1) - ($colram.count - 1)
                Memory_Size_Total = $($mem = $null; $colram.capacity | foreach {$mem += $_}; [math]::round($mem / 1gb, 0))
                Ram_Location      = $stick.DeviceLocator
                Ram_Capacity      = [math]::round($stick.capacity / 1gb, 0)
            } 
        }
    } else {
        [PSCustomObject]@{
            Total_Slots       = 'N/A'
            Slots_Populated   = 'N/A'
            Empty_Slots       = 'N/A'
            Memory_Size_Total = 'N/A'
            Ram_Location      = 'N/A'
            Ram_Capacity      = 'N/A'
        }
    }
$info