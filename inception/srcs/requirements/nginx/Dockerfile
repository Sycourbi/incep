#Permet d’indiquer à Docker sous quel OS doit tourner votre machine virtuelle.
#debian::11
FROM    debian:bullseye
#Permet de lancer une commande sur votre machine virtuelle
RUN	apt update -y 
RUN	apt install -y nginx
RUN	apt install -y vim
RUN	apt install -y curl
RUN mkdir -p /etc/nginx/ssl
RUN	apt install -y openssl

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=PARIS/O=42/OU=42/CN=sycourbi.42.fr/UID=sycourbi"
RUN mkdir -p /var/run/nginx
#Vous indiquez simplement ou se trouve votre fichier à copier à partir du répertoire ou se trouve votre Dockerfile Vous indiquez simplement ou se trouve votre fichier à copier à partir du répertoire ou se trouve votre Dockerfile
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

#Cela lancera NGINX en premier plan pour que le container ne se stop pas
CMD [ "nginx", "-g", "daemon off;" ]

