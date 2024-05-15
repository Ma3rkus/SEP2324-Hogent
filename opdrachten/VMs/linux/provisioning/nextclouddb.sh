#! /bin/bash

readonly db_root_password='IcAgWaict9?slamrol'

readonly ncdbname='ncrbmk'
readonly ncusername='nextcloud'
readonly ncpasswd='rbmk2324'


## Add
# transaction_isolation = READ-COMMITTED
# binlog_format = ROW
## to: /etc/my.cnf.d/mariadb-server.cnf

echo "[mysqld]
transaction_isolation = READ-COMMITTED
binlog_format = ROW" > /etc/my.cnf.d/ncsettings.cnf

systemctl restart mysqld

mysql --user=root --password="${db_root_password}" << _EOF_
CREATE DATABASE IF NOT EXISTS ${ncdbname} CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
GRANT ALL ON ${ncdbname}.* TO '${ncusername}'@'%' IDENTIFIED BY '${ncpasswd}';
FLUSH PRIVILEGES;
_EOF_

#mysqldump --user=nextcloud --password='rbmk2324' ncrbmk > /vagrant/db/nextcloud.sql
# mysql --user='nextcloud' --password='rbmk2324' 'ncrbmk' < /vagrant/db/nextcloud.sql