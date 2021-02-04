export DEBIAN_FRONTEND=noninteractive

#UPDATE && INSTALL PACKAGES
apt-get update
apt-get install -y nginx 

#INSTALL MYSQL
apt-get install -y wget 
apt-get install -y gnupg 
apt-get install -y lsb-release 
echo "mysql-apt-config mysql-apt-config/select-server select mysql-5.7" | debconf-set-selections
wget http://dev.mysql.com/get/mysql-apt-config_0.8.14-1_all.deb
dpkg --install mysql-apt-config_0.8.14-1_all.deb
apt-get update 
apt-get install -y mysql-server

#INSTALL PHPMYADMIN
apt-get install -y unzip
apt-get install -y php7.3-fpm
apt-get install -y php-mysql
unzip phpMyAdmin-4.9.2-all-languages.zip
rm phpMyAdmin-4.9.2-all-languages.zip
mv phpMyAdmin-4.9.2-all-languages /var/www/html/phpmyadmin
mv default /etc/nginx/sites-enabled/

#PROTOCOLE SSL
mv nginx-selfsigned.crt etc/ssl/certs/
mv nginx-selfsigned.key etc/ssl/private/

#INSTALL WORDPRESS
unzip wordpress-5.3.zip
rm wordpress-5.3.zip
mv wordpress /var/www/html/