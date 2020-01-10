#!/bin/bash
#Easy way
#GNS3 network configuration for virtualbox
sts = $?
#
#Connect with root
sudo su
#
#enter in folder netowrk interface (netplan)
cd /etc/netplan
if [ $sts -ne 0 ]; then
     echo " You don't have acces "
fi
#
#Clear default configuration
clear >> 90_gns3vm_static_netcfg.yaml
#
#Enter default configuration
echo "# Uncomment the following lines if you want to manually configure your network

network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      dhcp4: no
      addresses: [192.168.72.150/24]
      gateway4: 192.168.72.2
      nameservers:
          addresses: [8.8.8.8, 8.8.4.4]" >> 90_gns3vm_static_netcfg.yaml
echo "Netowrk has been configured"
echo "Your VM will be Reboot"
reboot
