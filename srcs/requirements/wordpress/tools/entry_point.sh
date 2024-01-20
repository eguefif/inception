#!/bin/bash

set -e

for i in {1..30}
do
	if mariadb -h $WP_DB_HOST -u $WP_DB_USER -p$WP_DB_PASSWORD <<< "use $WP_DB_NAME"; then
		break
	fi
	sleep 1
done

if [ $i = 30 ]; then
	echo "connection with mariadb failed: " $i
fi

if [ ! -f "/var/www/wp/index.php" ]; then
	tar -xvf wordpress-6.4.2-en_CA.tar.gz
	cp -r wordpress/* /var/www/wp
	rm -rf wordpress wordpress-6.4.2-en_CA.tar.gz
	cd /var/www/wp
	wp config create --allow-root \
		--dbname=$WP_DB_NAME \
		--dbuser=$WP_DB_USER \
		--dbpass=$WP_DB_PASSWORD \
		--dbhost=$WP_DB_HOST \
		--path="/var/www/wp"
	wp core install \
		--url='https://eguefif.42.fr' \
		--path="/var/www/wp" \
		--title="inception" \
		--admin_user="$WP_ADMIN" \
		--admin_password="$WP_ADMIN_PASS" \
		--admin_email="$WP_EMAIL" \
		--allow-root
	cd /var/www/wp
	wp user create $WP_USER $WP_USER_EMAIL \
		--role=administrator  \
		--user_pass=$WP_USER_PASS \
		--allow-root
fi

if [ ! -d "/run/php" ]; then
	mkdir /run/php
fi
php-fpm7.3 -F
