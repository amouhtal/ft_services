FROM alpine:3.12.3
RUN apk update
RUN apk add openrc influxdb
RUN openrc && touch /run/openrc/softlevel
COPY ./srcs/setup.sh /
RUN chmod +x /setup.sh
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf
EXPOSE 8086
CMD /setup.sh