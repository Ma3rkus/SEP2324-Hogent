#! /bin/bash

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

readonly ipv6addr='fd69:6f00:73d8:2c42::4/64'
readonly gateway_ipv6='fd69:6f00:73d8:2c42::1'


readonly WP_dir='/wordpress'
readonly HTTP_dir='/var/www/html'
readonly DB_ip='db1.g02-rbmk.internal'
readonly gateway_IP='192.168.102.129'

#------------------------------------------------------------------------------
# Wordpress Vars
#------------------------------------------------------------------------------

readonly wp_siteurl='https://www.g02-rbmk.internal'

#------------------------------------------------------------------------------
# "Imports"
#------------------------------------------------------------------------------

# Actions/settings common to all servers
# shellcheck disable=SC1091
source ${PROVISIONING_SCRIPTS}/common.sh

#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------

log "Setting default gateway"

log "Starting server specific provisioning tasks on ${HOSTNAME}"

log "Installing HTTP-deamon and PHP"

dnf install -y httpd php php-mysqlnd ed

log "Enabling httpd service"

systemctl enable --now httpd.service

log "Setting firewall rules"

firewall-cmd --list-all | grep '[^a-zA-Z]http[^a-zA-Z]' > /dev/null || firewall-cmd --add-service=http --permanent
firewall-cmd --reload

echo "
<VirtualHost *:80>
    DocumentRoot /var/www/html
    ServerName web-bas1.g02-rbmk.internal
    ServerAlias www.g02-rbmk.internal g02-rbmk.internal sepgroup02.hogent.be
    ErrorLog /var/log/httpd/bas-error.log
    CustomLog /var/log/httpd/bas-access.log combined
</VirtualHost>
" > /etc/httpd/conf.d/rbmk-basis.conf

##########################################
###         Wordpress stuff            ###
##########################################
log "Downloading the latest Wordpress version"

if [ ! -d "${WP_dir}" ] ; then
    sudo mkdir "${WP_dir}"
fi  

if [ ! -d "${WP_dir}/install" ] ; then
    sudo mkdir "${WP_dir}/install"
fi

# Check if there is a wordpress install on this server. If not, install it, if there is, skip.
if [ ! -d "/var/www/html/wp-admin" ] ; then
    wget --output-document="${WP_dir}/install/latest.tar.gz" https://wordpress.org/latest.tar.gz 

    log "Unpacking wordpress"
    tar -xzvf "${WP_dir}/install/latest.tar.gz" -C "${WP_dir}"

    log "Copy wordpress"

    cp -r "${WP_dir}/wordpress/." "${HTTP_dir}"


    log "Wordpress config"

    cp "${HTTP_dir}/wp-config-sample.php" "${HTTP_dir}/wp-config.php"

        sed -i "s/database_name_here/wordpressdb/" /var/www/html/wp-config.php
    sed -i "s/username_here/www_wordpress/" /var/www/html/wp-config.php
    sed -i "s/password_here/Kof3Cup.ByRu/" /var/www/html/wp-config.php
    sed -i "s/localhost/${DB_ip}/" /var/www/html/wp-config.php
    sed -i "s#Add any custom values between this line and the \"stop editing\" line. \*/#Add any custom values between this line and the \"stop editing\" line. \*/ \n define('WP_SITEURL', '${wp_siteurl}');\n define('WP_HOME', '${wp_siteurl}');\n \$_SERVER['HTTPS'] = 'on';#" /var/www/html/wp-config.php
    

    REPLACEMENT=$( curl -L https://api.wordpress.org/secret-key/1.1/salt/ )
    TO_REPLACE='put your unique phrase here'
    printf '%s\n' "g/${TO_REPLACE}/d" a "${REPLACEMENT}" . w | ed -s /var/www/html/wp-config.php

    chown -R apache:apache /var/www/html/

    log "Setting up SELinux"
    setsebool -P httpd_can_network_connect_db 1

    ## We can ignore this part if we automate the RBMK site.
    log "Auto OG setup"
    # Automate the original setup (<ip>/wp-admin/install.php)
    #curl -k -d "weblog_title=${wptitle}&user_name=${wpuser}&admin_password=${wppass}&admin_password2=${wppass}&admin_email=${wpemail}" "http://localhost/wp-admin/install.php?step=2"
    
    ## This is the RBMK site
    mkdir -p /var/www/html/wp-content/uploads/2024/03
    wget https://sep.dhdn.eu/chernobyl.jpg -O /var/www/html/wp-content/uploads/2024/03/chernobyl.jpg
    wget https://sep.dhdn.eu/rbmk-log.png -O /var/www/html/wp-content/uploads/2024/03/rbmk-log.png
fi

##############################################################
                                  
###### #    # ##### #####    ##   
#       #  #    #   #    #  #  #  
#####    ##     #   #    # #    # 
#        ##     #   #####  ###### 
#       #  #    #   #   #  #    # 
###### #    #   #   #    # #    # 
                                  
                                                               
#    # ###### #####   ####  ###### #####  #    # ###### #####  
#    # #      #    # #      #      #    # #    # #      #    # 
#    # #####  #####   ####  #####  #    # #    # #####  #    # 
# ## # #      #    #      # #      #####  #    # #      #####  
##  ## #      #    # #    # #      #   #   #  #  #      #   #  
#    # ###### #####   ####  ###### #    #   ##   ###### #    # 
                                                               
##############################################################


echo "
<VirtualHost *:80>
    DocumentRoot /var/www/ext
    ServerName web-ext1.g02-rbmk.internal
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