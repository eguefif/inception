#!/bin/bash

service php7.3-fpm start
sed -i "s/127\.0\.0\.1/0\.0\.0\.0/g" /etc/php/7.3/fpm/pool.d/www.conf

kill $(cat /var/run/php7.3-fpm.pid)
#tail -f /dev/null
php-fpm7.3
