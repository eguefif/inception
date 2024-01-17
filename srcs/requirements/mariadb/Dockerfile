FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./entry_point.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry_point.sh

EXPOSE 3306

#CMD ["tail", "-f", "/dev/null"]
ENTRYPOINT ["entry_point.sh"]
#CMD ["mysqld"]
