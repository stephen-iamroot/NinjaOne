$Query = "Select * from  SoftwareLicensingProduct Where PartialProductKey LIKE '%'"
$LicenseInfo = Get-CimInstance -Query $Query -ErrorAction Stop 
            Switch ($LicenseInfo.LicenseStatus) {
                0 {$LicenseStatus = 'Unlicensed'; Break}
                1 {$LicenseStatus = 'Licensed'; Break}
                2 {$LicenseStatus = 'OOBGrace'; Break}
                3 {$LicenseStatus = 'OOTGrace'; Break}
                4 {$LicenseStatus = 'NonGenuineGrace'; Break}
                5 {$LicenseStatus = 'Notification'; Break}
                6 {$LicenseStatus = 'ExtendedGrace'; Break}
            }
            $LicenseInfo | Where -Property Name -like "Windows*" | Select-Object @{N = 'LicenseStatus'; E={$LicenseStatus}}
            Ninja-Property-Set windowslicensestatus $LicenseStatus