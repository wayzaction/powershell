$array = @('OsName',
'OsVersion',
'CsManufacturer',
'CsModel',
'CsProcessors',
'CsTotalPhysicalMemory',
'BiosVersion',
'WindowsBuildLabEx',
'TimeZone',
'NetworkAdapters')

Get-ComputerInfo | Select-Object -Property $array | Format-List
