#!/bin/bash

service mysql start 
sed -i "s/127\.0\.0\.1/0\.0\.0\.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf
echo "CREATE DATABASE IF NOT EXITS $MYSQL_DATABASE;" > inception.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" >> inception.sql
echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' ;" >> inception.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" >> inception.sql
echo "FLUSH PRIVILEGES;" >> inception.sql
mysql < inception.sql
rm inception.sql
kill $(cat /var/run/mysqld/mysqld.pid)
mysqld
