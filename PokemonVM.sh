#!/bin/bash

# Define variables
VM_NAME="pokemon"
OS_TYPE="Ubuntu_64"
ISO_PATH="/path/to/ubuntu.iso"
VM_RAM="2048" # 2GB RAM
VM_CPU="2"    # 2 CPU cores
VM_HDD_SIZE="20000" # 20GB HDD
USER="ash"
PASSWORD_HASH="$(echo -n 'Groudon#123' | sha512sum | cut -d' ' -f1)"
JOKE_FLAG="how_do_you_get_pikachu_on_a_bus?"

# Create VM
VBoxManage createvm --name $VM_NAME --ostype $OS_TYPE --register

# Configure VM
VBoxManage modifyvm $VM_NAME --memory $VM_RAM --cpus $VM_CPU

# Create and attach virtual HDD
VBoxManage createhd --filename $VM_NAME.vdi --size $VM_HDD_SIZE
VBoxManage storagectl $VM_NAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium $VM_NAME.vdi

# Attach ISO
VBoxManage storagectl $VM_NAME --name "IDE Controller" --add ide
VBoxManage storageattach $VM_NAME --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $ISO_PATH

# Start VM
VBoxManage startvm $VM_NAME

# Wait for VM to boot up
sleep 30

# Simulate vulnerable configurations
# Create user account 'ash' with password 'Groudon#123'
VBoxManage guestcontrol $VM_NAME run --username root --password 'root' -- /usr/sbin/useradd $USER --password $PASSWORD_HASH

# Install Ruby and Rails
VBoxManage guestcontrol $VM_NAME run --username root --password 'root' -- /usr/bin/apt-get install -y ruby ruby-dev
VBoxManage guestcontrol $VM_NAME run --username root --password 'root' -- /usr/bin/gem install rails --no-document

# Create vulnerable Ruby on Rails application
VBoxManage guestcontrol $VM_NAME run --username $USER --password 'Groudon#123' -- /bin/bash -c "rails new vulnerable_app"
VBoxManage guestcontrol $VM_NAME run --username $USER --password 'Groudon#123' -- /bin/bash -c "cd vulnerable_app && rails generate controller Vulnerable index"
VBoxManage guestcontrol $VM_NAME run --username $USER --password 'Groudon#123' -- /bin/bash -c "echo 'Vulnerable code with security flaws' > /home/$USER/vulnerable_app/app/controllers/vulnerable_controller.rb"

# Create joke flag file
VBoxManage guestcontrol $VM_NAME run --username $USER --password 'Groudon#123' -- /bin/bash -c "echo \"$JOKE_FLAG\" > /home/$USER/Desktop/jokeflag.txt"

echo "VM setup complete. Enjoy your journey in the world of Pokémon!"