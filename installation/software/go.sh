go_linux() {
    pinfo "@go @linux #software @start"

    wget -q https://storage.googleapis.com/golang/getgo/installer_linux
    chmod +x installer_linux
    ./installer_linux
    rm -rf installer_linux
  
    psuccess "@go @linux #software @done"
}