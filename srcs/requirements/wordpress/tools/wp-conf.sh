#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

timeout=15
end=$((SECONDS + timeout))
while [ $SECONDS -lt $end ]; do
    if nc -z mariadb 3306; then
        break
    fi
    sleep 1
done

wp core download --allow-root
wp config create --dbhost=mariadb:3306 --dbname="$MYSQL_DB" --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root
wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$WP_ADMIN_NAME" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_EMAIL" --allow-root
wp user create  $WP_USER_NAME $WP_USER_EMAIL --user_pass=$WP_USER_PASS --role=author --allow-root

#EDIT
wp theme install generatepress --activate --allow-root
#EDIT



sed -i 's|listen = /run/php/php7.4-fpm.sock|listen = 9000|g' /etc/php/7.4/fpm/pool.d/www.conf
mkdir -p /run/php
exec /usr/sbin/php-fpm7.4 -F
