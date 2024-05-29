#!/bin/bash

# Define variables
VM_NAME="windows_vm"
ISO_PATH="/path/to/windows.iso"
VM_RAM="4096" # 4GB RAM
VM_CPU="2"    # 2 CPU cores
VM_HDD_SIZE="40000" # 40GB HDD
USER="ash"
PASSWORD="Kyogre@987"
JOKE_FLAG="Why did the Pokémon bring a ladder to the battle? Because it wanted to level up!"

# Create VM
VBoxManage createvm --name $VM_NAME --ostype "Windows10_64" --register

# Configure VM
VBoxManage modifyvm $VM_NAME --memory $VM_RAM --cpus $VM_CPU

# Create and attach virtual HDD
VBoxManage createhd --filename "$VM_NAME.vdi" --size $VM_HDD_SIZE
VBoxManage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium "$VM_NAME.vdi"

# Attach ISO
VBoxManage storagectl $VM_NAME --name "IDE Controller" --add ide
VBoxManage storageattach $VM_NAME --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium "$ISO_PATH"

# Start VM
VBoxManage startvm $VM_NAME

# Wait for VM to boot up
sleep 60

# Simulate vulnerable configurations
# Create user account 'ash' with password 'Kyogre@987'
VBoxManage guestcontrol $VM_NAME run --username Administrator --password 'Administrator' -- /usr/sbin/useradd $USER --password $PASSWORD

# Create joke flag file
VBoxManage guestcontrol $VM_NAME run --username $USER --password $PASSWORD -- /usr/bin/cmd /c "echo $JOKE_FLAG > C:\Users\$USER\Recent\jokeflag.txt"

echo "VM setup complete. Enjoy your journey!"