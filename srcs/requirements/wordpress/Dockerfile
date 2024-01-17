FROM debian:buster

RUN apt-get update && apt-get update; \
	apt-get install -y php php7.3-fpm mariadb-client php-mysql

COPY ./www.conf /etc/php/7.3/fpm/pool.d/
COPY ./entry_point.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entry_point.sh

EXPOSE 9000
CMD ["entry_point.sh"]
#CMD ["tail", "-f", "/dev/null"]
