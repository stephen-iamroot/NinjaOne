$printers = Get-Printer | Select-Object Name | ft -hidetableheaders | Out-String
Ninja-Property-Set installedPrinters $printers