FROM debian:buster

RUN apt-get update && apt-get update; \
	apt-get install -y php php7.3-fpm mariadb-client php-mysql vim 

COPY ./www.conf /etc/php/7.3/fpm/pool.d/
COPY ./entry_point.sh /usr/local/bin
COPY ./wp-config.php /
COPY ./wordpress-6.4.2-en_CA.tar.gz /
COPY ./wp-cli.phar ./usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN chmod +x /usr/local/bin/entry_point.sh

ENTRYPOINT ["/usr/local/bin/entry_point.sh"]
#WORKDIR /var/www/wp
#CMD ["tail", "-f", "/dev/null"]
#CMD ["php-fpm7.3", "-F"]
