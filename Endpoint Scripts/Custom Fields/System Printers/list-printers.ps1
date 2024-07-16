$printers = Get-Printer | Select-Object Name | Format-Table -hidetableheaders | Out-String
Ninja-Property-Set installedPrinters $printers