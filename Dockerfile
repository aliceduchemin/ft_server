FROM	debian:buster

RUN	apt-get update && apt-get -y install wget nginx
#RUN	apt-get -y install mariadb-server
#RUN	apt-get -y install default-mysql-server
#RUN	apt-get -y install default-mysql-server default-mysql-client
RUN	apt-get -y install php7.3 php7.3-fpm php7.3-common php7.3-cli php7.3-mysql php7.3-cgi 


#RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
#RUN	tar -zxvf phpMyAdmin-4.9.5-all-languages.tar.gz
#RUN	mv phpMyAdmin-4.9.5-all-languages /var/www/html

#RUN	wget -c http://wordpress.org/latest.tar.gz
#RUN	tar -xzvf latest.tar.gz
#RUN	mv wordpress /var/www/html

RUN	chown -R www-data /var/www/*
RUN	chmod -R 755 /var/www/*
RUN	chown www-data:www-data /usr/share/nginx/html/ -R

#RUN	rm /etc/nginx/sites-available/default
RUN	rm /etc/nginx/sites-enabled/default
ADD	./srcs/monsite.conf /etc/nginx/conf.d/default.conf
#ADD	./srcs/mon_site.com.conf /etc/nginx/sites-available/default
#ADD	./srcs/mon_site.com.conf /etc/nginx/sites-enabled/default
#RUN	ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
#ADD	./srcs/nginx.conf /etc/nginx/

#RUN	mkdir /var/www/monsite
ADD	./srcs/info.php /usr/share/nginx/html/

ADD	./srcs/www.conf /etc/php/7.3/fpm/pool.d/

RUN	service php7.3-fpm start
#RUN	-v /var/run/mysqld/mysqld.sock:/tmp/mysqld.sock
#ADD	./srcs/db.sh /db.sh
#ADD	./srcs/nginx.conf /var/www/html/nginx.conf

#ADD	./srcs/default /etc/nginx/sites-available/
#ADD	./srcs/wordpress /etc/nginx/sites-available/

#RUN	rm /usr/share/nginx/html/index.nginx-debian.html
ADD	./srcs/index.html /usr/share/nginx/html/
#ADD	./srcs/config.inc.php /var/www/html/
#ADD	./srcs/wp-config.php /var/www/html/wordpress/

#RUN	service nginx restart
#ENV	MYSQL_ROOT_PASSWORD=password
##ENV	MYSQL_USER=admin
##ENV	MYSQL_PASSWORD=admin

#RUN	/usr/sbin/a2ensite default-ssl
#RUN	/usr/sbin/a2enmod ssl

##RUN	echo "daemon off;" >> /etc/nginx/nginx.conf

#CMD	service mysql start;\
#	mysql -u root -p$MYSQL_PASSWORD -e "CREATE USER '$MYSQL_USER'@'localhost' identified by '$PASSWORD';" ;\
#	mysql -u root -p$MYSQL_PASSWORD -e "CREATE DATABASE wordpress;" ;\
#	mysql -u root -p$MYSQL_PASSWORD -e "GRANT ALL PRIVILEGES ON wordpress.* TO '$MYSQL_USER'@'localhost';" ;\
#	mysql -u root -p$MYSQL_PASSWORD -e "FLUSH PRIVILEGES;";\
#	nginx -g 'daemon off;'


#RUN	bash db.sh
#RUN	service mysql-server restart
#ENTRYPOINT	["/db.sh"]
#CMD	bash db.sh && tail -f /dev/null
#CMD	bash db.sh && nginx -g daemon off
#CMD	["bash", "db.sh", "nginx", "-g", "daemon off;"]
CMD	["nginx", "-g", "daemon off;"]
