FROM debian:buster

RUN apt update; \
	apt install -y php php-cli php-fpm wordpress

EXPOSE 9000
CMD ["php-fpm"]
