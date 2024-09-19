# Inception

## Description

**Inception** est un projet du cursus 42 qui consiste à configurer et déployer un ensemble de services dans des conteneurs Docker, le tout orchestré via Docker Compose. Le but est de comprendre les bases de la virtualisation à travers Docker, tout en respectant des normes strictes de gestion des ressources et des bonnes pratiques en termes de sécurité.

Le projet repose sur plusieurs services : une base de données, un serveur web, et d'autres services nécessaires pour héberger une application web.

## Objectifs

- Utiliser **Docker** et **Docker Compose** pour virtualiser plusieurs services.
- Configurer chaque service dans son propre conteneur.
- Respecter des normes de sécurité comme l’isolation des conteneurs.
- Maîtriser la configuration des réseaux, des volumes, et des accès sécurisés.

## Structure du projet

Ce dépôt contient :

- Des fichiers de configuration Docker pour chaque service.
- Un fichier `docker-compose.yml` pour orchestrer tous les conteneurs.
- Des scripts et fichiers de configuration pour personnaliser chaque service.

### Arborescence du dépôt
```
.
├── srcs
│   ├── requirements
│   │   ├── mariadb
│   │   ├── nginx
│   │   ├── wordpress
│   │   └── tools
│   └── docker-compose.yml
└── README.md
```

## Services

Le projet Inception implémente les services suivants :

- **MariaDB** : un serveur de base de données relationnelle utilisé par WordPress.
- **Nginx** : un serveur web utilisé pour servir le contenu et gérer le reverse proxy.
- **WordPress** : une application web utilisée comme site de démonstration.
- **PhpMyAdmin** *(optionnel)* : un outil web pour gérer MariaDB via une interface graphique.

## Prérequis

Avant de commencer, assurez-vous d'avoir installé :

- [Docker](https://www.docker.com/get-started) (version 20.10+)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 1.29+)

## Installation

Suivez ces étapes pour déployer l'environnement avec Docker :

1. Clonez ce dépôt sur votre machine locale :

    ```bash
    git clone https://github.com/Sycourbi/incep.git
    cd incep
    ```

2. Démarrez les services Docker avec Docker Compose :

    ```bash
    docker-compose up --build
    ```

3. Les services seront disponibles aux adresses suivantes une fois lancés :

    - WordPress : `http://localhost`
    - PhpMyAdmin : `http://localhost:8080` *(si activé)*

## Utilisation

### Accéder à WordPress

Ouvrez votre navigateur et allez sur `http://localhost` pour accéder à l'interface de WordPress.

### Accéder à PhpMyAdmin

Si PhpMyAdmin est activé, rendez-vous sur `http://localhost:8080`. Connectez-vous avec les identifiants configurés pour MariaDB.

## Configuration

### Variables d'environnement

Vous pouvez personnaliser certains paramètres dans les fichiers de configuration et d'environnement pour adapter les services à vos besoins.

- Base de données : Les identifiants MariaDB sont définis dans les variables d'environnement.
- Nginx : Les configurations de Nginx peuvent être trouvées dans le dossier `nginx`.
- WordPress : Le fichier de configuration WordPress peut être ajusté selon vos besoins dans le dossier `wordpress`.
