FROM debian:buster

RUN apt update;\
	apt install -y nginx openssl

ADD ./conf/default.conf /etc/nginx/conf.d
COPY ./conf/openssl.cnf /etc/ssl/openssl.cnf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
