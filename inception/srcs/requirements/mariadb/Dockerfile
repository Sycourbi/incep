#debian::11
FROM    debian:bullseye

# Mettre à jour et installer mariadb-server
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server
RUN apt-get install -y mariadb-client
RUN apt-get install -y procps

# Copier le fichier de configuration de MariaDB
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /var/run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown mysql:mysql /var/run/mysqld/
RUN chmod -R 755 /var/run/mysqld/
RUN chown mysql:mysql /var/lib/mysql/
RUN chmod -R 755 /var/lib/mysql/

EXPOSE 3306

# Copier le script d'initialisation
COPY ./tools/mariadb_script.sh .
RUN chmod +x ./mariadb_script.sh

# Définir le point d'entrée
ENTRYPOINT ["bash", "./mariadb_script.sh"]