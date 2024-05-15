#! /bin/bash
readonly db_root_password='IcAgWaict9?slamrol'
readonly db_ext_name=trialsite
readonly db_ext_table=trialsite_tbl
readonly db_ext_user=www_user
readonly db_ext_password='rbmk2324'


mysql --user=root --password="${db_root_password}" << _EOF_
CREATE DATABASE IF NOT EXISTS ${db_ext_name};
GRANT ALL ON ${db_ext_name}.* TO '${db_ext_user}'@'%' IDENTIFIED BY '${db_ext_password}';
FLUSH PRIVILEGES;
_EOF_

mysql --user="${db_ext_user}" --password="${db_ext_password}" "${db_ext_name}" <<_EOF_
CREATE TABLE IF NOT EXISTS ${db_ext_table} (
  id int(5) NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  PRIMARY KEY(id)
);
REPLACE INTO ${db_ext_table} (id,name) VALUES (1,"Tuxedo T. Penguin");
REPLACE INTO ${db_ext_table} (id,name) VALUES (2,"Bobby Tables");
_EOF_