Set-ExecutionPolicy Unrestricted


(Get-WmiObject Win32_ComputerSystem).Rename("MyMachineName") | Out-Null

# Move Personal folders to external drive: Music, Photos, Downloads, etc
