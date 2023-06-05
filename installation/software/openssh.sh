#!/bin/bash

openssh_linux(){
    pinfo "@openssh @linux #software @start"

    sudo systemctl start sshd
    sudo systemctl enable sshd

    psuccess "@openssh @linux #software @done" 
}
