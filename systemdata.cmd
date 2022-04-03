@echo off


set filename=%computername%_systemdata.txt

wmic /APPEND:"%filename%" os get Caption,CSDVersion
rem ver >> "%filename%"
rem systeminfo >> "%filename%"
echo Motherboard
wmic /APPEND:"%filename%" baseboard get SerialNumber,Version,Manufacturer,Product
echo Computer system
wmic /APPEND:"%filename%" computersystem get Caption,Description,DNSHostName,OEMStringArray,Roles,Domain,Manufacturer,Model,NumberOfProcessors,NumberOfLogicalProcessors,SystemFamily,TotalPhysicalMemory,SystemSKUNumber,UserName
wmic /APPEND:"%filename%" csproduct
echo Cpu
wmic /APPEND:"%filename%" cpu get name
echo Disks
wmic /APPEND:"%filename%" diskdrive get model,serialNumber,firmwareRevision,size
echo Bios
wmic /APPEND:"%filename%" bios get Manufacturer,Name,ReleaseDate,SerialNumber,SMBIOSBIOSVersion
echo Graphics
wmic /APPEND:"%filename%" path win32_VideoController get name
echo Network
wmic /APPEND:"%filename%" nic get Speed,Manufacturer,Name,Netenabled
echo Memory
wmic /APPEND:"%filename%" memorychip get devicelocator, manufacturer, PartNumber,Speed,SerialNumber,Capacity,BankLabel
echo Software
wmic /APPEND:"%filename%" product get name,vendor,version,InstallDate