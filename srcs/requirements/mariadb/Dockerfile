FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server vim

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/entry_point.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entry_point.sh
RUN mkdir /run/mysql
RUN mkdir /run/mysqld
RUN chown -R mysql:mysql /run/mysql
RUN chown -R mysql:mysql /var/lib/mysql
RUN chown -R mysql:mysql /run/mysqld

EXPOSE 3306

CMD ["entry_point.sh"]
#CMD ["tail", "-f", "/dev/null"]
#CMD ["mysqld"]
