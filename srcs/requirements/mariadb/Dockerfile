FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./entry_point.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry_point.sh

EXPOSE 3306

CMD ["entry_point.sh"]
