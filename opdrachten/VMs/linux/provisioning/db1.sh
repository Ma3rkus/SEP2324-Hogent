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


readonly ipv6addr='fd69:6f00:73d8:2c42::3/64'
readonly gateway_ipv6='fd69:6f00:73d8:2c42::1'


readonly db_root_password='IcAgWaict9?slamrol'
readonly db_name="wordpressdb"
readonly db_user="www_wordpress"
readonly db_password='Kof3Cup.ByRu'
readonly db_name_ext="wordpress_ext_db"
readonly db_user_ext="www_wordpress_ext"
readonly db_password_ext='rbmk2324'

readonly gateway_IP='192.168.102.129'


#------------------------------------------------------------------------------
# Functions
#------------------------------------------------------------------------------

# Predicate that returns exit status 0 if the database root password
# is not set, a nonzero exit status otherwise.
is_mysql_root_password_empty() {
  mysqladmin --user=root status > /dev/null 2>&1
}

#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

# First perform common actions for all servers
# shellcheck disable=SC1091
source ${PROVISIONING_SCRIPTS}/common.sh

log "Setting default gateway"
echo "GATEWAY=${gateway_IP}" >> /etc/sysconfig/network-scripts/ifcfg-eth0

log "=== Starting server specific provisioning tasks on ${HOSTNAME} ==="

log "Installing MariaDB server"

dnf install -y mariadb-server 

log "Enabling MariaDB service"

systemctl enable --now mariadb.service

log "Setting firewall rules"

firewall-cmd --add-service=mysql --permanent
# firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="192.168.102.132" service name="mysql" accept'
firewall-cmd --reload

log "Securing the database"

if is_mysql_root_password_empty; then
mysql <<_EOF_
  SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${db_root_password}');
  DELETE FROM mysql.user WHERE User='';
  DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
  DROP DATABASE IF EXISTS test;
  DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
  FLUSH PRIVILEGES;
_EOF_
fi

log "Creating database and user"

mysql --user=root --password="${db_root_password}" << _EOF_
CREATE DATABASE IF NOT EXISTS ${db_name};
GRANT ALL ON ${db_name}.* TO '${db_user}'@'%' IDENTIFIED BY '${db_password}';
FLUSH PRIVILEGES;
_EOF_

mysql --user=root --password="${db_root_password}" << _EOF_
CREATE DATABASE IF NOT EXISTS ${db_name_ext};
GRANT ALL ON ${db_name_ext}.* TO '${db_user_ext}'@'%' IDENTIFIED BY '${db_password_ext}';
FLUSH PRIVILEGES;
_EOF_


#mysqldump --user=www_wordpress --password='Kof3Cup.ByRu' wordpressdb > wordpressdb.sql

mysql --user="${db_user}" --password="${db_password}" "${db_name}" < /vagrant/db/wordpressdb.sql

/vagrant/provisioning/nextclouddb.sh
/vagrant/provisioning/extdb.sh

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