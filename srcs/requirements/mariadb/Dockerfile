FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server

COPY ./tools/mdb-conf.sh .

RUN chmod +x mdb-conf.sh

EXPOSE 3306

ENTRYPOINT [ "bash" ]

CMD [ "-c", "./mdb-conf.sh" ]
