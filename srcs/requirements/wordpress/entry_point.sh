#!/bin/bash

if [ ! -d "/var/www/wp" ]; then
	mkdir /var/www/wp
fi

if [ ! -d "/var/run/php-fpm" ]; then
	mkdir /var/run/php
fi


#kill $(cat /var/run/php7.3-fpm.pid)
#tail -f /dev/null
#service php7.3-fpm start
php-fpm7.3
