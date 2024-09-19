#debian::11
FROM debian:bullseye

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y wget

# Installez les version 7.3 php
RUN apt-get install -y php7.4 php-fpm php-mysql

# Installez WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Téléchargez et installez WordPress
RUN apt-get update && apt-get install -y default-mysql-client
RUN apt-get install -y mariadb-client
RUN wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www/html
RUN cd /var/www/html \
	&& tar -xzf /var/www/html/wordpress-6.1.1.tar.gz \
	&& rm /var/www/html/wordpress-6.1.1.tar.gz

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

EXPOSE 9000

# Copiez le script d'auto-configuration
COPY ./tools/auto_config.sh .
RUN chmod +x ./auto_config.sh

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

# Définissez le point d'entrée
ENTRYPOINT ["./auto_config.sh"]
