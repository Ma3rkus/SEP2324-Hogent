#! /bin/bash
#
# Provisioning script for srv001

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

# Enable "Bash strict mode"
set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------

readonly gateway_IP='192.168.102.225'
readonly ipv6addr='fd69:6f00:73d8:2c13::2/64'
readonly gateway_ipv6='fd69:6f00:73d8:2c13::1'


# Location of provisioning scripts and files
export readonly PROVISIONING_SCRIPTS="/vagrant/provisioning/"
# Location of files to be copied to this server
export readonly PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/files/${HOSTNAME}"


#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

# First perform common actions for all servers
# shellcheck disable=SC1091
source ${PROVISIONING_SCRIPTS}/common.sh

# In vagrant install this is needed so nginx can access the webserver.
sudo ip route | grep '192.168.102.0/24' > /dev/null || ip route add 192.168.102.0/24 via 192.168.102.225

log "Firewall stuff"
firewall-cmd --list-all | grep '[^a-zA-Z]http[^a-zA-Z]' > /dev/null || firewall-cmd --add-service=https --permanent
firewall-cmd --reload

### GUESS WHAT? I still have to do almost everything :P

log "Network touchups"

# Add IPv6 to eth1
{
  echo "IPV6INIT=yes"
  echo "IPV6ADDR=${ipv6addr}"
  echo "IPV6_DEFAULTGW=${gateway_ipv6}"
} >> /etc/sysconfig/network-scripts/ifcfg-eth1

/vagrant/provisioning/networks.sh "$gateway_IP" "192.168.102.130"