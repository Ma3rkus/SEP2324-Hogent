#! /bin/bash

gateway_IP=$1

mv -f /etc/sysconfig/network-scripts/ifcfg-eth1 /etc/sysconfig/network-scripts/ifcfg-eth0
sed -i "s/eth1/eth0/" /etc/sysconfig/network-scripts/ifcfg-eth0

echo "GATEWAY=${gateway_IP}" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "nameserver 192.168.102.130
nameserver 192.168.102.136" > /etc/resolv.conf
