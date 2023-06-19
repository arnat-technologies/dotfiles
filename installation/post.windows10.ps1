Set-ExecutionPolicy Unrestricted


(Get-WmiObject Win32_ComputerSystem).Rename("MyMachineName") | Out-Null

# Move Personal folders to external drive: Music, Photos, Downloads, etc

# TODO

- [ ] Migrate Spotify to external HDD
- [ ] Migrate Docker to external HDD
- [ ] Migrate Google Drive to external HDD
- [ ] Migrate Onedrive to extenral Drive
- [ ] Create folder for OpenSource Software for external drive
- [ ] Migrate Installable Windows software to external drive
