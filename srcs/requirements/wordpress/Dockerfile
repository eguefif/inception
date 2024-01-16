FROM debian:buster

RUN apt update; \
	apt install -y php php-cli php7.3-fpm wordpress

EXPOSE 9000
CMD ["php-fpm7.3", "--nodaemonize"]
