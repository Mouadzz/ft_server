#CREATE NEW ROOT AND PASSWORD 
chown -R mysql: /var/lib/mysql
service mysql start
mysql --user=root -e "CREATE USER 'mouad'@'localhost' IDENTIFIED BY 'dev';GRANT ALL PRIVILEGES ON * . * TO 'mouad'@'localhost';FLUSH PRIVILEGES;"

#CREATE DATABASE	
mysql --user=root -e "CREATE DATABASE wordpress;GRANT ALL PRIVILEGES on wordpress.* TO 'mouad'@'localhost' IDENTIFIED BY 'dev';FLUSH PRIVILEGES;"
chown -R www-data:www-data /var/www/html/wordpress/

#STATRTER SERVICES
apt update
service mysql start
service php7.3-fpm start
nginx -g "daemon off;"
