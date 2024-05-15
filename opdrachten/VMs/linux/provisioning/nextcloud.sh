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


readonly ipv6addr='fd69:6f00:73d8:2c42::6/64'
readonly gateway_ipv6='fd69:6f00:73d8:2c42::1'
readonly gateway_IP='192.168.102.129'

readonly db_ip='db1.g02-rbmk.internal'
readonly ncdbname='ncrbmk'
readonly ncusername='nextcloud'
readonly ncpasswd='rbmk2324'

readonly ncadmin='rbmk2324'
readonly ncadminpass='rbmk2324'


# First perform common actions for all servers
# shellcheck disable=SC1091
source ${PROVISIONING_SCRIPTS}/common.sh

echo "nameserver 192.168.102.130
nameserver 192.168.102.136" > /etc/resolv.conf

dnf install -y epel-release mysql policycoreutils-python-utils unzip httpd php php-mysqlnd php-cli php-gd php-mbstring php-intl php-pecl-apcu php-opcache php-json php-zip php-process

sed -i 's/memory_limit = 128M/memory_limit = 512M/' /etc/php.ini

echo '
<VirtualHost *:80>
  DocumentRoot /var/www/nextcloud/
  ServerName  nc1.g02-rbmk.internal
  ServerAlias nextcloud.g02-rbmk.internal
  
  ErrorLog /var/log/httpd/nc-error.log
  CustomLog /var/log/httpd/nc-access.log combined

  <Directory /var/www/nextcloud/>
    Require all granted
    AllowOverride All
    Options FollowSymLinks MultiViews

    <IfModule mod_dav.c>
      Dav off
    </IfModule>
  </Directory>
</VirtualHost>
' > /etc/httpd/conf.d/nextcloud.conf



if [ ! -f "latest.zip" ]; then
  wget https://download.nextcloud.com/server/releases/latest.zip
fi

if [ ! -d "/var/www/nextcloud" ]; then
  unzip -d /var/www/ latest.zip
fi

if [ ! -d "/var/www/nextcloud/data" ]; then
  mkdir /var/www/nextcloud/data
fi

chown -R apache:apache /var/www/nextcloud/

semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/nextcloud/data(/.*)?'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/nextcloud/config(/.*)?'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/nextcloud/apps(/.*)?'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/nextcloud/.htaccess'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/nextcloud/.user.ini'
semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/nextcloud/3rdparty/aws/aws-sdk-php/src/data/logs(/.*)?'

restorecon -R '/var/www/nextcloud/'

setsebool -P httpd_can_network_connect_db on
setsebool -P httpd_can_network_connect 1

firewall-cmd --permanent --add-service=http
firewall-cmd --add-service=http

systemctl enable httpd
systemctl start httpd

# Check for databast tables
linecount=$( mysql --host='db1.g02-rbmk.internal' --user=nextcloud --password='rbmk2324' ncrbmk << _EOF_ | wc -l
SHOW Tables
_EOF_
)
if [ "${linecount}" -eq "104" ]; then
  mysql --host="${db_ip}" --user="${ncusername}" --password="${ncpasswd}" "${ncdbname}" < /vagrant/db/dropnextcloud.sql
fi


curl 'http://nc1.g02-rbmk.internal/index.php' -X POST -H 'Content-Type: application/x-www-form-urlencoded' --data-raw "install=true&adminlogin=${ncadmin}&adminpass=${ncadminpass}&directory=%2Fvar%2Fwww%2Fnextcloud%2Fdata&dbtype=mysql&dbuser=${ncusername}&dbpass=${ncpasswd}&dbpass-clone=${ncpasswd}&dbname=${ncdbname}&dbhost=${db_ip}:3306"

sed -i "s/ 0 => 'nc1.g02-rbmk.internal',/0 => 'nc1.g02-rbmk.internal',\n   1 => 'nextcloud.g02-rbmk.internal',\n   2 => 'www.nextcloud.g02-rbmk.internal'/" /var/www/nextcloud/config/config.php
sudo sed -i "s#'overwrite.cli.url' => 'http://nc1.g02-rbmk.internal',#'overwrite.cli.url' => 'https://nextcloud.g02-rbmk.internal',#" /var/www/nextcloud/config/config.php
sudo sed -i "s/true,/true,\n  'trusted_proxies'   => ['192.168.102.226'],\n  'overwritehost'     => 'nextcloud.g02-rbmk.internal',\n  'overwriteprotocol' => 'https',/" /var/www/nextcloud/config/config.php

sudo -u apache php /var/www/nextcloud/occ app:install calendar

##############################################################
                                  
#######                            
#       #    # ##### #####    ##   
#        #  #    #   #    #  #  #  
#####     ##     #   #    # #    # 
#         ##     #   #####  ###### 
#        #  #    #   #   #  #    # 
####### #    #   #   #    # #    # 
                                   
                                                                   #####  
#    # ###### #####   ####  ###### #####  #    # ###### #####     #     # 
#    # #      #    # #      #      #    # #    # #      #    #          # 
#    # #####  #####   ####  #####  #    # #    # #####  #    #     #####  
# ## # #      #    #      # #      #####  #    # #      #####     #       
##  ## #      #    # #    # #      #   #   #  #  #      #   #     #       
#    # ###### #####   ####  ###### #    #   ##   ###### #    #    ####### 
                                                               
##############################################################

echo "
<VirtualHost *:80>
    DocumentRoot /var/www/ext
    ServerName web-ext2.g02-rbmk.internal
    ServerAlias ext.g02-rbmk.internal
    ErrorLog /var/log/httpd/ext-error.log
    CustomLog /var/log/httpd/ext-access.log combined
</VirtualHost>
" > /etc/httpd/conf.d/ext.conf

mkdir /var/www/ext/

cp /vagrant/db/index.php /var/www/ext/index.php

chown -R apache:apache /var/www/ext/

systemctl restart httpd


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