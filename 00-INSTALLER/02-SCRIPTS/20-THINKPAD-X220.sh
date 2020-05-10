{
echo "\nPreinstalling for Thinkpad x220 i3\n"

# Update the system clock
timedatectl set-ntp true

# Partition the disks
parted /dev/sda mklabel gpt
echo "mklabel gpt
mkpart primary ext4 0% 100%
set 1 boot on
quit
" | parted /dev/sda

# FDISK
fdisk /dev/sda
g # to generate GPT disklabel
n # generate EFI, 1 > enter > +300M
t # select partition > 1 > EFI
n # new data partition enter > enter (all the rest)
p # check partition table
w # write

# Format the partitions
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2

# Mount the partitions
mount /dev/sda2 /mnt
mkdir /mnt/home

# Install the base packages
pacstrap /mnt base base-devel grub

# Change root into the new system and run installation
genfstab -Up /mnt >> /mnt/etc/fstab

arch-chroot /mnt /bin/bash install-x220-i3.sh

# Pipe all output into log file
} |& tee -a /root/Arch-Installation.log
mv /root/Arch-Installation.log /mnt/home/$(ls /mnt/home/)/

# Reboot because systemctl & localectl are not available while chroot
umount -R /mnt
echo "Pre-Installation DONE, time to restart :v"
