FROM alpine:3.12.3
RUN apk update && apk add nginx && apk add openrc
RUN rc-update add nginx default
RUN rc-status && touch /run/openrc/softlevel
RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx && chown -R www:www /www
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
COPY ./srcs/nginx.conf /etc/nginx/nginx.conf
COPY ./srcs/index.html /www/index.html
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt
EXPOSE 80
EXPOSE 443
COPY ./srcs/run.sh /run.sh
RUN chmod +x run.sh
CMD sh run.sh