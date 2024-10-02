FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y curl php7.4 php7.4-fpm php7.4-mysql mariadb-client netcat inetutils-ping

COPY ./tools/wp-conf.sh .

RUN  chmod +x wp-conf.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT [ "bash" ]

CMD [ "-c" , "/wp-conf.sh" ]
