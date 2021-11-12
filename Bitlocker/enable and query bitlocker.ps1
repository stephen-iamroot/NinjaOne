#2018-12-12 - Coded by Stephen Murphy - techfoundry.co.uk
Get-BitLockerVolume | where-object { $_.ProtectionStatus -eq "Off" -or $_.EncryptionPercentage -gt 0 } | select * | % {
  
    Enable-Bitlocker -MountPoint $_.MountPoint -EncryptionMethod Aes256 -UsedSpaceOnly -RecoveryPasswordProtector -SkipHardwareTest -WarningAction SilentlyContinue
    $protectorIDs = $(Get-BitLockerVolume -MountPoint $_.MountPoint).KeyProtector | Where-Object {$_.KeyProtectorType -eq "RecoveryPassword"}
    
      foreach ($protectorID in $protectorIDs) {
        
       (Get-BitLockerVolume -MountPoint $_.MountPoint).KeyProtector | Where-Object {$_.KeyProtectorType -eq "RecoveryPassword"}
        
      }