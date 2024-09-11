#!/bin/bash

# Start MariaDB
service mariadb start
sleep 5

mariadb -e "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DB\`;"

# Create user
# '@'%' runs on any ip
mariadb -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"

# Grant privileges
mariadb -e "GRANT ALL PRIVILEGES ON \`$MYSQL_DB\`.* TO '$MYSQL_USER'@'%';"

# Flush privileges
mariadb -e "FLUSH PRIVILEGES;"

# Shutdown MariaDB
mysqladmin -u root -p"$MYSQL_ROOT_PASSWORD" shutdown

# Restart MariaDB
exec mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
