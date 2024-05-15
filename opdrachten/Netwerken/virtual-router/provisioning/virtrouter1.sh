#! /bin/bash
#
# Provisioning script for virtrouter1

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit  # abort on nonzero exitstatus
set -o nounset  # abort on unbound variable
set -o pipefail # don't mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------

# Location of provisioning scripts and files
export readonly PROVISIONING_SCRIPTS="/vagrant/provisioning/"
# Location of files to be copied to this server
export readonly PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/files/${HOSTNAME}"

#------------------------------------------------------------------------------
# Router setup
#------------------------------------------------------------------------------

apt update && apt upgrade -y

# Enable routing
echo "net.ipv4.ip_forward = 1" >>/etc/sysctl.conf
/usr/sbin/sysctl -p

# Setup static IP
/usr/bin/cat <<EOF >>/etc/network/interfaces
allow-hotplug eth1
iface eth1 inet static
    address 192.168.102.129
    netmask 255.255.255.224

allow-hotplug eth2
iface eth2 inet static
    address 192.168.102.225
    netmask 255.255.255.248

allow-hotplug eth3
iface eth3 inet static
    address 192.168.102.1
    netmask 255.255.255.128
EOF

# Enable NAT'ing
systemctl enable nftables
systemctl start nftables

/usr/bin/cat <<EOF >/etc/nftables.conf
#!/usr/sbin/nft -f

# Flush the rule set
flush ruleset

# Create a nat table
add table nat
add chain nat prerouting { type nat hook prerouting priority -100 ; }
add chain nat postrouting { type nat hook postrouting priority 100 ; }
add rule nat postrouting oifname "eth0" masquerade
EOF

reboot now
