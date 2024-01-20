FROM debian:buster

RUN apt-get update && apt-get update; \
	apt-get install -y php php7.3-fpm mariadb-client php-mysql mariadb-client

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/entry_point.sh /usr/local/bin
COPY ./tools/wordpress-6.4.2-en_CA.tar.gz /
COPY ./tools/wp-cli.phar ./usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN chmod +x /usr/local/bin/entry_point.sh

EXPOSE 9000

ENTRYPOINT ["/usr/local/bin/entry_point.sh"]
