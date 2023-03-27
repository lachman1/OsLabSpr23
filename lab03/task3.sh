#!/bin/bash

# Ask for user inputs
echo "Please enter the hostname for your SAMBA server:"
read hostname

echo "Please enter the workgroup name for your SAMBA server:"
read workgroup

echo "Please enter the SAMBA server password:"
read password

# Install SAMBA server and configure
sudo apt-get update
sudo apt-get install samba -y

sudo sed -i 's/.*security = .*/   security = user/g' /etc/samba/smb.conf
sudo sed -i "/\[global\]/a workgroup = $workgroup\nnetbios name = $hostname\n" /etc/samba/smb.conf

sudo useradd -m sambauser -p $(openssl passwd -1 $password)
sudo smbpasswd -a sambauser

sudo systemctl restart smbd.service
sudo systemctl enable smbd.service

echo "SAMBA server installation complete."

