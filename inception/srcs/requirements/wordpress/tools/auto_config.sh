#!/bin/bash

#etre certain que la base de donnees MariaDB a bien eu le temps de se lancer correctement.
sleep 10

cd /var/www/html/wordpress
# Verifier si WordPress a deja ete configure
if [ ! -f wp-config.php ]; then
	echo "cREATING CONFIG .... !\n"
	wp config create --allow-root \
		--dbname=${SQL_DATABASE} \
		--dbuser=${SQL_USER} \
		--dbpass=${SQL_PASSWORD} \
		--dbhost=mariadb \
		--path='/var/www/html/wordpress' \
		--url=https://${DOMAIN_NAME}

	wp core install	--allow-root \
				--path='/var/www/html/wordpress' \
				--url=https://${DOMAIN_NAME} \
				--title=${SITE_TITLE} \
				--admin_user=${ADMIN_USER} \
				--admin_password=${ADMIN_PASSWORD} \
				--admin_email=${ADMIN_EMAIL};

	wp user create		--allow-root \
				${SECOND_USER} ${SECOND_USER_EMAIL} \
				--role=author \
				--user_pass=${SECOND_USER_PASSWORD} ;

	# empty cache
	wp cache flush --allow-root
	echo "wp-config created successfully !"
fi

if [ ! -d /run/php ]; then
	mkdir /run/php;
fi

# Lancer php-fpm en premier plan pour que le conteneur ne se termine pas
exec /usr/sbin/php-fpm7.4 -F -R