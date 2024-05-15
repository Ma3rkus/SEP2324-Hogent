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

# Location of provisioning scripts and files
export readonly PROVISIONING_SCRIPTS="/vagrant/provisioning/"
# Location of files to be copied to this server
export readonly PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/files/${HOSTNAME}"

export readonly NETWORKING_SCRIPTS="${PROVISIONING_SCRIPTS}/configScripts"

#------------------------------------------------------------------------------
# "Imports"
#------------------------------------------------------------------------------

# Actions/settings common to all servers
source ${PROVISIONING_SCRIPTS}/common.sh

#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Starting server specific provisioning tasks on ${HOSTNAME}"

log "Installing nescessary components"
dnf -y install tftp-server &> /dev/null

log "Setting up tftp config"
if [ ! -d "/etc/xinetd.d" ]; then
    mkdir /etc/xinetd.d
fi
if [ ! -f "/etc/xinetd.d/tftp" ]; then
    touch /etc/xinetd.d/tftp
fi

echo 'service tftp
    {
        socket_type             = dgram
        protocol                = udp
        port                    = 69
        wait                    = yes
        user                    = nobody
        server                  = /usr/sbin/in.tftpd
        server_args             = -c -s /var/lib/tftpboot
        disable                 = no
        per_source              = 11
        cps                     = 100 2
        flags                   = IPv4
    }' > /etc/xinetd.d/tftp

log "Setting up needed folders"
if [ -d "/var/lib/tftpboot" ]; then
    chmod -R 777 /var/lib/tftpboot
    chown -R nobody: /var/lib/tftpboot
fi

log "Starting the tftp service"
systemctl start tftp
systemctl enable tftp

log "Setting firewall rules"
firewall-cmd --add-service=tftp --permanent
firewall-cmd --reload

log "transfering configfiles"
cp /vagrant/configsNetwork/config* /var/lib/tftpboot
find /var/lib/tftpboot -type f -exec chmod 777 {} \;

echo "* * * * * /vagrant/cronjob.sh" | crontab -