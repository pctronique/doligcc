# dgcc (Docker GCC)

La base docker pour un projet en assembleurC ou C++. Vous pouvez utiliser cmake.

<details>
  <summary>Table des matières</summary>
  <ol>
    <li>
        <a href="#création-du-conteneur-docker">Création du conteneur (Docker)</a>
        <ul>
            <li><a href="#le-fichier-env">Le fichier .env</a></li>
            <li><a href="#installer-le-conteneur">Installer le conteneur</a></li>
        </ul>
    </li>
    <li><a href="#rechercher-un-package-docker">Rechercher un package (Docker)</a></li>
    <li>
        <a href="#install-un-package-docker">Install un package (Docker)</a>
        <ul>
            <li><a href="#le-fichier-env">Le fichier .env</a></li>
            <li><a href="#dans-dockerfile">Dans Dockerfile</a></li>
        </ul>
    </li>
    <li><a href="#le-dossier-du-projet">Le dossier du projet</a></li>
  </ol>
</details>

## Création du conteneur (Docker)
Vous devez avoir installé Docker.
Pour la création du conteneur docker pour le projet.
### Le fichier .env
Modifier le fichier .env :
```
NAME_GCC_CONTAINER=dgcc_gcc
```
Par le nom de votre projet, par exemple 'nameProject' :
```
NAME_GCC_CONTAINER=nameProject_gcc
```


### Installer le conteneur
Vous pouvez créer votre conteneur.
```
$ ./install.sh
```

## Rechercher un package (Docker)
Si vous avez besoin d'un package pour votre projet dans le conteneur. Vous pouvez rechercher les packages disponibles pour le conteneur.
```
$ ./bin/terminal.sh
# apt-cache search name_package
```

## Install un package (Docker)
Si vous avez besoin d'installer un package dans votre conteneur.
```
$ ./bin/terminal.sh
# apt install name_package
```

### Dans Dockerfile
Quand vous installez un package, vous devez aussi le rajouter dans le fichier "**.docker/linux_agcc/Dockerfile**", pour le conserver. Vous devez ajouter la ligne suivante à la fin du fichier avec le bon nom de package.
```
RUN apt install name_package
```

## Le dossier du projet
Votre code devra être placé dans le dossier "**project**"
