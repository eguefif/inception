FROM debian:buster

RUN apt update; \
	apt install -y php php-cli php7.3-fpm wordpress

COPY ./entry_point.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entry_point.sh

EXPOSE 9000
CMD ["entry_point.sh"]
#CMD ["tail", "-f", "/dev/null"]
