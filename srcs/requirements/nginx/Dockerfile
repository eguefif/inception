FROM debian:buster

RUN apt update;\
	apt install -y nginx openssl

ADD ./conf/default.conf /etc/nginx/conf.d
COPY ./tools/entry-point.sh /
RUN chmod +x /entry-point.sh

EXPOSE 443

WORKDIR /etc/ssl/certs/

#ENTRYPOINT ["/entry-point.sh"]

#CMD ["nginx", "-g", "daemon off;"]
CMD ["tail", "-f", "/dev/null"]
