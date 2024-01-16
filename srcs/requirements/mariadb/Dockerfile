FROM debian:buster

RUN 	apt update;\
	apt install -y mariadb-server; \
	apt install mysql_secure_installation

EXPOSE 3306

RUN ["mysqld"]
