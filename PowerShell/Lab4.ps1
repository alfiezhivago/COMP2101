function get-syshardware
{
"   system hardware description   "
Get-WmiObject win32_computersystem | Format-List
"=========================="
}
get-syshardware
#commands for printing operating system details
function get-os {
"   operating system detais  "
Get-WmiObject win32_operatingsystem|Select-Object name, version|Format-list
"========================="
}
get-os
#Commands for printing processor details
function get-processor {
"   processor details"
Get-CimInstance -ClassName cim_processor | format-list name, numberofcores, currentclockspeed,
@{n= "L1CacheSize"; e= {switch ($_.L1CacheSize) { $null { $output = "L1 cache size does not exist"} default {$output = $_.L1CacheSize } }; $output } },
@{n= "L2CacheSize"; e= {switch ($_.L2CacheSize) { $null { $output = "L2 cache size does not exist"} default {$output = $_.L2CacheSize } }; $output } },
@{n= "L3CacheSize"; e= {switch ($_.L3CacheSize) { $null { $output = "L3 cache size does not exist"} default {$output = $_.L3CacheSize } }; $output } }
"==========================" 
}
get-processor
#Command for printing RAM summary
function get-ram {
"  RAM summary"
$A=0
$B = Get-WmiObject win32_physicalmemory 
foreach ($A in $B) {
                     new-object -typename psobject -property @{Vendor=$A.Manufacturer
                                                               Description=$A.Description
                                                               "Size(GB)"=$A.Capacity / 1gb -as [int]
                                                               BankLabel= $A.banklabel
                                                               Slot = $A.Devicelocator
                                                               }
                                                               $A = $A.capacity/1gb -as [int]
                                                               }
                                                               "
Total RAM (GB) = $($A)"
"=========================="
}
get-ram
#Commands for printing summary of physical drives
function get-diskdrives {
"  physical drive summary"
$diskdrives = Get-CimInstance cim_diskdrive
foreach ($disk in $diskdrives)
{
$partitions = $disk|Get-CimAssociatedInstance -resultclassname cim_diskpartition
foreach ($partition in $partitions )
{
$logicaldisks = $partition | Get-CimAssociatedInstance -ResultClassName cim_logicaldisk
foreach ($logicaldisk in $logicaldisks)
{
New-Object -TypeName psobject -Property @{Vendor=$disk.Manufacturer
                                           model=$disk.model
                                          Location=$partition.deviceid
                                          Drive=$logicaldisk.deviceid
                                          "Size(GB)"=$logicaldisk.size/1gb -as [int]
                                          "Freespace(GB)"=$logicaldisk.freespace/1gb -as [int]
                                          "Percentage free"= 100*($logicaldisk.freespace)/($logicaldisk.size + $logicaldisk.freespace)
                                          }|Format-Table
}
}
}
"============================="}
get-diskdrives  
#Section for printing network adapter configuration from last lab
function get-network {
"    network adapter summary"
lab3.ps1
"============================="}
get-network
#command for printing videocard summary
function get-video {
"   video card summary"
Get-WmiObject win32_videocontroller | Select-Object name, description, videomodedescription | Format-list
"==============================" }
get-video
"            END" 