
FROM alpine:3.14.2

RUN apk update && apk add openrc mariadb mariadb-client 
RUN openrc && touch /run/openrc/softlevel
COPY ./db.sql /var/lib/mysql/
COPY ./setup.sh /
RUN chmod +x setup.sh

CMD ./setup.sh