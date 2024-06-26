# doligcc : DOcker LInux GCC
Par [pctronique](https://pctronique.fr/) <br />
Version 1.1.0

<details>
  <summary>Table des matières</summary>
  <ol>
    <li><a href="#Présentation">Présentation</a></li>
    <li>
        <a href="#Installation">Installation</a>
        <ul>
            <li><a href="#Le-nom-du-projet">Le nom du projet</a></li>
            <li><a href="#le-nom-de-lexécutable">Le nom de l'exécutable</a></li>
            <li><a href="#Le-fichier-env">Le fichier .env</a></li>
            <li><a href="#Création-des-conteneurs">Création des conteneurs</a></li>
            <li><a href="#Où-placer-le-code">Où placer le code</a></li>
        </ul>
    </li>
    <li><a href="#Cron">Cron</a></li>
    <li>
        <a href="#Autres-informations">Autres informations</a>
        <ul>
            <li><a href="#Versions">Versions</a></li>
            <li><a href="#Installer-la-dernière-version">Installer la dernière version</a></li>
        </ul>
    </li>
  </ol>
</details>

## Présentation

Pour créer un projet c ou cpp avec docker.

Pour Linux.

Les versions :
<ul>
  <li>ubuntu:24.04</li>
  <li>java:21</li>
</ul>

> [!NOTE]
> Ce code doit être mis dans votre projet git et devra être transmis sur le git (sans le fichier « README.md » pour pas écraser le vôtre).
>
> Il fera partie du projet. Et le faire pour chaque projet c ou cpp.

## Installation

Vous devez avoir installé [docker-desktop](https://www.docker.com/products/docker-desktop/) sur votre système d'exploitation avant de pouvoir utiliser ce code.

### Le nom du projet

Modifier le nom du projet dans le fichier « .env.example » :
```
NAME_PROJECT=doligcc
```
Mettre le nom du projet.

> [!WARNING]
> Le faire avant de créer le fichier « .env ».

### Le nom de l'exécutable

Modifier le nom de l'exécutable dans le fichier « .env.example » :
```
BIN_NAME_EXE=doligcc
```
Mettre le nom de l'exécutable.

> [!WARNING]
> Le faire avant de créer le fichier « .env ».

### Le fichier .env

Sur un terminal (pour créer le fichier « .env ») :
```
$ cp .env.example .env
```

### Création des conteneurs

```
$ docker compose up -d
```
> [!WARNING]
> Vous avez besoin du fichier « .env », sinon vous allez avoir des erreurs.

### Où placer le code

Le code devra être placé dans le dossier « project/src ».
les fichiers d’en-tête dans le dossier « project/include ».

## Cron

Vous pouvez facilement mettre en place des tâches planifiés.
Vous devez les placer dans le fichier « ./config/dockercron ».

Exemple (dans « ./config/dockercron ») :
```
*  *  *  *  * echo "hello" >> /var/log/docker/php/testcron.log
*  *  *  *  * echo "hello projet" >> /usr/local/apache2/www/testcron.log
```

> [!NOTE]
> Toutes modifications du fichier sera récupérée automatiquement par le conteneur.

## Autres informations

### Versions

Pour que le projet soit toujours valide, il est préférable de mettre en place des versions fixes.

> [!WARNING]
> Le faire avant de créer le fichier « .env ».

Il est possible de modifier les versions des conteneurs dans le fichier « .env.example ».
```
VALUE_GCC_VERSION=14.1.0
```

> [!NOTE]
> Prendre une version fpm pour php.

### Installer la dernière version
> [!WARNING]
> À utiliser une seule fois dans la création du projet et ensuite remettre la valeur des versions que vous aurez obtenue. Ne surtout pas conserver ce format dans un projet.

```
VALUE_GCC_VERSION=latest
```
