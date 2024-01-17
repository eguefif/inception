#!/bin/bash

set -e


#if [ ! -d "/var/lib/mysql/entry_point.sh" ]; then
service mysql start 
echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" > inception.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> inception.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" >> inception.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> inception.sql
echo "FLUSH PRIVILEGES;" >> inception.sql
mysql -u root  < inception.sql
rm inception.sql
cp /usr/local/bin/entry_point.sh /var/lib/mysql/
kill $(cat /var/run/mysqld/mysqld.pid)
#fi

mysqld
