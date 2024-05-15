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

log "Installing reverse proxy software"
sudo dnf install nginx -y

log "Firewall stuff"
firewall-cmd --list-all | grep '[^a-zA-Z]http[^a-zA-Z]' > /dev/null || firewall-cmd --add-service=http --permanent
firewall-cmd --list-all | grep '[^a-zA-Z]https[^a-zA-Z]' > /dev/null || firewall-cmd --add-service=https --permanent
firewall-cmd --reload

setsebool -P httpd_can_network_connect 1

# shellcheck disable=SC2016
echo '
server {
    listen 80 default_server;
    server_name _;
    return 301 https://$host$request_uri;
}

server {
        listen 443 ssl http2 default_server;
        listen [::]:443 ssl http2;
        server_name g02-rbmk.internal www.g02-rbmk.internal;

        ssl_certificate /etc/nginx/ssl/g02-rbmk.internal.crt;
        ssl_certificate_key /etc/nginx/ssl/g02-rbmk.internal.key;

        location / {
                proxy_pass http://web-bas1.g02-rbmk.internal;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
        }
}

upstream ext {
        ip_hash;
        server web-ext1.g02-rbmk.internal;
        server web-ext2.g02-rbmk.internal;
 }

server {
        listen 443 ssl http2;
        listen [::]:443 ssl http2;
        server_name ext.g02-rbmk.internal;

        ssl_certificate /etc/nginx/ssl/g02-rbmk.internal.crt;
        ssl_certificate_key /etc/nginx/ssl/g02-rbmk.internal.key;

        location / {
                proxy_pass http://ext;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
        }
}

server {
        listen 443 ssl http2;
        listen [::]:443 ssl http2;
        server_name nextcloud.g02-rbmk.internal;

        ssl_certificate /etc/nginx/ssl/g02-rbmk.internal.crt;
        ssl_certificate_key /etc/nginx/ssl/g02-rbmk.internal.key;

        location / {
                proxy_pass http://nc1.g02-rbmk.internal;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
        }
}
' > /etc/nginx/conf.d/g02-rbmk.internal.conf

sed -i 's/# for more information./server_tokens off;/' /etc/nginx/nginx.conf

log "SSL"
mkdir -p /etc/nginx/ssl/
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout "/etc/nginx/ssl/g02-rbmk.internal.key" -out "/etc/nginx/ssl/g02-rbmk.internal.crt" -subj "/C=BE/ST=EastFlanders/L=Ghent/O=RBMK/CN=g02-rbmk.internal"


log "Starting the service"
systemctl enable nginx

log "Network touchups"
if [ -f /etc/sysconfig/network-scripts/ifcfg-eth1 ]; then
	# Add IPv6 to eth1
	{
	echo "IPV6INIT=yes"
	echo "IPV6ADDR=${ipv6addr}"
	echo "IPV6_DEFAULTGW=${gateway_ipv6}"
	} >> /etc/sysconfig/network-scripts/ifcfg-eth1
	/vagrant/provisioning/networks.sh "$gateway_IP"

fi