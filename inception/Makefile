# Variables
DOCKER_COMPOSE = docker-compose
SRC_DIR = srcs

# Cibles
.PHONY: all build up down clean

# Par défaut, exécuter les cibles build et up
all: build up

# Construire les images Docker et ajuster les permissions des répertoires
build:
# Créer les répertoires de données pour MariaDB et WordPress s'ils n'existent pas déjà
	sudo mkdir -p /home/sycourbi/data/mariadb
	sudo mkdir -p /home/sycourbi/data/wordpress
# Construire les images Docker avec Docker Compose
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml -p inception build

# Démarrer les conteneurs Docker
up:
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml -p inception up -d

# Arrêter et supprimer les conteneurs Docker
down:
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml -p inception down

# Nettoyer les volumes Docker
clean:
	$(DOCKER_COMPOSE) -f $(SRC_DIR)/docker-compose.yml -p inception down -v

# Cible de secours pour afficher l'aide
help:
	@echo "Utilisation du Makefile :"
	@echo "  make          : Construire et démarrer les conteneurs Docker"
	@echo "  make build    : Construire les images Docker"
	@echo "  make up       : Démarrer les conteneurs Docker"
	@echo "  make down     : Arrêter et supprimer les conteneurs Docker"
	@echo "  make clean    : Nettoyer les volumes Docker"
	@echo "  make help     : Afficher cette aide"