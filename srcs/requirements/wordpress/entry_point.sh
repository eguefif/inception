#!/bin/bash

#set -e

#sleep 2

#if [ ! -d "/var/www/wp/index.hp" ]; then
tar -xvf /var/www/wordpress-6.4.2-en_CA.tar.gz
cp -r wordpress/* /var/www/wp
rm -rf wordpress
rm wordpress-6.4.2-en_CA.tar.gz
mv /wp-config.php /var/www/wp/wp-config.php
wp core install --path=/var/www/wp --url=0.0.0.0:9000 --title=inception --admin_user=$WORDPRESS_ADMIN --admin_password=$WORDPRESS_ADMIN_PASS
wp user create $WORDPRESS_USER --user_pass=$WORDPRESS_USER_PASS
wp super-admin add $WORDPRESS_USER
#fi

if [ ! -d "/run/php" ]; then
	mkdir /run/php
fi
php-fpm7.3 -F
