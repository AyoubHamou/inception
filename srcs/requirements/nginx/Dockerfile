FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/ssl.crt -keyout /etc/nginx/ssl/ssl.key\
    -subj "/C=MO/ST=BE/O=1337/CN=ahamou.42.fr"

ENTRYPOINT [ "nginx" ]

CMD ["-g", "daemon off;"]
