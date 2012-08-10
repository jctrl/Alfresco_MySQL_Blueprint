#!/bin/bash

# Import global conf 
. $global_conf

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
set -e

echo Creating database $mysql_db
mysqladmin -u $db_admin_user -p$db_admin_pass create $mysql_db

echo "Creating Mysql database user"
mysql -u $db_admin_user -p$db_admin_pass -e "CREATE USER '$mysql_db_user'@'%' IDENTIFIED BY '$mysql_db_pass';"
mysql -u $db_admin_user -p$db_admin_pass -e "GRANT ALL PRIVILEGES ON $mysql_db.* TO '$mysql_db_user'@'%';"
