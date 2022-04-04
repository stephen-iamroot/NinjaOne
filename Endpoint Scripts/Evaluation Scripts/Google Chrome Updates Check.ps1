if ((Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\Policies\Google\Update" -Name "Update{8A69D345-D564-463C-AFF1-A69D9E530F96}") -eq '0'){
    Write-Host "Chrome Updates Disabled"
    #Set-ItemProperty "HKLM:\SOFTWARE\Policies\Google\Update" "Update{8A69D345-D564-463C-AFF1-A69D9E530F96}" 1
}

if ((Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\Policies\Google\Update" -Name "Update{4DC8B4CA-1BDA-483E-B5FA-D3C12E15B62D}") -eq '0'){
    Write-Host "Chrome Updates Disabled"
    #Set-ItemProperty "HKLM:\SOFTWARE\Policies\Google\Update" "Update{4DC8B4CA-1BDA-483E-B5FA-D3C12E15B62D}" 1
}

if ((Get-ItemPropertyValue -Path "HKLM:\SOFTWARE\Policies\Google\Update" -Name "DisableAutoUpdateChecksCheckboxValue") -eq '1'){
    Write-Host "Chrome Updates Disabled"
    #Set-ItemProperty "HKLM:\SOFTWARE\Policies\Google\Update" "DisableAutoUpdateChecksCheckboxValue" 0
}