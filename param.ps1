# Ask for elevated permissions if required
If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")) {
	Write-Host "Administrator permissions required"
	Exit
}

Get-WmiObject -class Win32_BaseBoard        | Format-Table Manufacturer,Product
Get-WmiObject -class Win32_computersystem   | Format-List Caption,Manufacturer,Model

#Get-WmiObject -class Win32_BaseBoard | Select-Object -expand Product
#Get-WmiObject -class Win32_BaseBoard | Select-Object -expand Manufacturer

$_model =        Read-Host -Prompt "Please enter Model"
$_manufacturer = Read-Host -Prompt "Please enter Manufacturer"

if (!($_model))        { $_model        = Get-WmiObject -class Win32_BaseBoard | Select-Object -expand Product }
if (!($_manufacturer)) { $_manufacturer = Get-WmiObject -class Win32_BaseBoard | Select-Object -expand Manufacturer }

If (!(Test-Path    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation")) {
	New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name "Model"        -Type String -Value $_model
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name "Manufacturer" -Type String -Value $_manufacturer
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation" -Name "Logo"         -Type String -Value "c:\windows\oem.bmp"

If ((Test-Path ($PSScriptRoot+"\oem1.bmp"))) {
Move-Item -Path ($PSScriptRoot+"\oem1.bmp") -Destination "$env:windir\oem.bmp"
#Copy-Item -Path ($PSScriptRoot+"\oem1.bmp") -Destination "$env:windir\oem1234.bmp"
}