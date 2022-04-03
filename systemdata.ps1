$filename = (HOSTNAME) + "_systemdata1.txt"

Get-WmiObject -class Win32_OperatingSystem       | Format-Table Caption,BuildNumber,OSArchitecture,Version >> $filename
Get-WmiObject -class Win32_BaseBoard             | Format-Table SerialNumber,Version,Manufacturer,Product >> $filename
Get-WmiObject -class Win32_computersystem        | Format-List  Caption,Description,DNSHostName,OEMStringArray,Roles,Domain,Manufacturer,Model,NumberOfProcessors,NumberOfLogicalProcessors,SystemFamily,TotalPhysicalMemory,SystemSKUNumber,UserName >> $filename
Get-WmiObject -class Win32_computersystemproduct | Format-List  Caption,Description,IdentifyingNumber,Name,SKUNumber,UUID,Vendor,Version >> $filename
Get-WmiObject -class Win32_Processor             | Format-Table Name,Caption,Description,NumberOfCores,NumberOfLogicalProcessors >> $filename
Get-WmiObject -Class Win32_DiskDrive             | Format-Table Model,SerialNumber,FirmwareRevision,Size >> $filename
Get-WmiObject -Class Win32_BIOS                  | Format-Table Manufacturer,Name,ReleaseDate,SerialNumber,SMBIOSBISVersion -auto >> $filename
Get-WmiObject -Class win32_VideoController       | Format-list  Name >> $filename
Get-WmiObject -Class Win32_NetworkAdapter        | Sort-Object -Property Manufacturer  | Format-table Manufacturer,Name,Netenabled,Speed >> $filename
Get-WmiObject -Class Win32_PhysicalMemory        | Format-table devicelocator,BankLabel, manufacturer, PartNumber,Speed,SerialNumber,Capacity >> $filename
Get-WmiObject -Class Win32_Product               | Sort-Object -Property vendor        | Format-table name,vendor,version,InstallDate >> $filename
Get-Content $filename