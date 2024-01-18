#!/bin/bash

set -e

for i in {1..30}
do
	if mariadb -h $WP_DB_HOST -u $WP_DB_USER -p$WP_DB_PASSWORD <<< "use $WP_DB_NAME"; then
		break
	fi
	sleep 2
done

if [ $i = 30 ]; then
	echo "connection with mariadb failed: " $i
fi

<<commant
if [ -f "/var/www/wp/index.php" ]; then
	tar -xvf wordpress-6.4.2-en_CA.tar.gz
	cp -r wordpress/* /var/www/wp
	rm -rf wordpress wordpress-6.4.2-en_CA.tar.gz
	mv /wp-config.php /var/www/wp/wp-config.php
	#wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_PASS --dbhost=$WP_DB_HOST --allow-root
	wp core install --path="/var/www/wp" --url="0.0.0.0:9000" --title="inception" --admin_user="$WP_ADMIN" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_EMAIL" --allow-root
	wp user create $WP_USER --user_pass=$WP_USER_PASS --allow-root
	wp super-admin add $WP_USER
fi
commant

if [ ! -d "/run/php" ]; then
	mkdir /run/php
fi
tail -f /dev/null
php-fpm7.3 -F
