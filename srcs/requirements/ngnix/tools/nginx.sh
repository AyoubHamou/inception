#!/bin/bash

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -out /etc/nginx/ssl/ssl.crt -keyout /etc/nginx/ssl/ssl.key\
    -subj "/C=MO/ST=BE/O=1337/CN=ahamou.42.fr"

exec nginx -g "daemon off;"
