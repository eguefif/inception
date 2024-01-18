FROM debian:buster

RUN apt update;\
	apt install -y nginx

ADD ./conf/default.conf /etc/nginx/conf.d

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
