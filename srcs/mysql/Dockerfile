FROM alpine:3.12.3

RUN apk add openrc
RUN apk add mariadb mariadb-common mariadb-client
RUN rc-update add mariadb default
RUN rc-status && touch /run/openrc/softlevel

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./telegraf.conf /etc/telegraf.conf

ADD ./wordpress.sql ./wordpress.sql
EXPOSE 3306
ADD run.sh ./run.sh
RUN chmod +x run.sh
CMD sh run.sh