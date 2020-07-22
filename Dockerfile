FROM	debian:buster

RUN	apt-get update && apt-get -y install wget nginx \
	&& apt-get -y install mariadb-server \
	&& apt-get -y install php php-fpm php-mysql php-cli php-json php-mbstring

RUN	chown -R $USER:$USER /var/www/*
RUN	chmod -R 755 /var/www/*

RUN	wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
RUN	tar -zxvf phpMyAdmin-4.9.5-all-languages.tar.gz \
	&& mv phpMyAdmin-4.9.5-all-languages /var/www/html/phpmyadmin

RUN	wget -c http://wordpress.org/latest.tar.gz
RUN	tar -xzvf latest.tar.gz \
	&& mv wordpress/* /var/www/html/

RUN	mkdir /etc/nginx/ssl
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt \
	-subj "/C=FR/ST=Ile de France/L=Paris/O=42/CN=aduchemi"

ADD	./srcs/www.conf /etc/php/7.3/pool.d/
RUN	rm /var/www/html/phpmyadmin/config.sample.inc.php
RUN	mkdir /var/www/html/phpmyadmin/tmp \
	&& chmod -R 777 /var/www/html/phpmyadmin/tmp
ADD	./srcs/config.inc.php /var/www/html/phpmyadmin/
ADD	./srcs/wp-config.php /var/www/html/

ADD	./srcs/localhost /etc/nginx/sites-available/
RUN	rm /etc/nginx/sites-enabled/default
RUN	ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN	service nginx start
RUN	service php7.3-fpm start

ENV	MYSQL_USER 'admin'
ENV	MYSQL_PASS 'admin'
RUN	service mysql start \
	&& mysql -u root -p$MYSQL_PASS -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_PASS';" \
	&& mysql -u root -p$MYSQL_PASS -e "CREATE DATABASE wordpress;" \
	&& mysql -u root -p$MYSQL_PASS -e "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'localhost';" \
	&& mysql -u root -p$MYSQL_PASS -e "FLUSH PRIVILEGES;"

ADD	./srcs/container.sh /

CMD	bash /container.sh
