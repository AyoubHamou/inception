FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/nginx.sh .

RUN chmod +x nginx.sh

ENTRYPOINT [ "bash" ]

CMD ["-c", "./nginx.sh"]
