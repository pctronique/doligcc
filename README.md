# dgcc (Docker GCC)

<details>
  <summary>Table des matières</summary>
  <ol>
    <li>
        <a href="#présentation">Présentation</a>
        <ul>
            <li><a href="#l-avantage-d-utiliser-docker">L'avantage d'utiliser docker</a></li>
            <li><a href="#conteneur-gcc">Conteneur gcc</a></li>
            <li><a href="#autres-conteneurs">Autres conteneurs</a></li>
        </ul>
    </li>
    <li>
        <a href="#création-du-conteneur-docker">Création du conteneur (Docker)</a>
        <ul>
            <li><a href="#le-fichier-env">Le fichier .env</a></li>
            <li><a href="#installer-le-conteneur">Installer le conteneur</a></li>
            <li><a href="#modifier-les-versions">Modifier les versions</a></li>
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

## Présentation
La base docker pour un projet en assembleur C ou C++. Ceci est une base, vous pouvez le modifier selon vos besoins.<br />
> [!WARNING]
> Vous devez installer docker pour pouvoir l'utiliser.

### L'avantage d'utiliser docker
Lorsque vos faites un projet avec docker vous devez transmettre la totalité du projet, les fichiers de création des conteneurs et le code. Pour ce projet, vous devez transmettre le contenu en totalité du dossier "**dgcc**" (**que vous pouvez et surtout devez le renommer au nom de votre projet**) dans un git.<br />
Les avantages :<br />
* Pas de programme à installer sur votre pc (à part docker et un éditeur ou IDE)
* Travailler à plusieurs avec les mêmes conteneurs à l'identique
* Prêt à travailler directement sur le code après la création des conteneurs
<br /> Après installation des conteneurs, on peut directement continuer le code.

### Conteneur gcc
Il est conçu à partir de l'image du [docker gcc](https://hub.docker.com/_/gcc).<br />
Il contiendra vos codes.<br />
Il installe aussi dans le conteneur :<br />
* [cmake](https://cmake.org/)

<br /> 
C'est dans ce conteneur que vous allez placer vos codes c ou c++, dans le dossier "**project**" (qui est lié au conteneur).

### Autres conteneurs
Vous pouvez installer d'autres conteneurs, comme par exemple le conteneur pour une SGBD. Ici, je donne seulement la base du code.

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

### Modifier les versions
> [!WARNING]
> Il est indispensable de le faire pour pouvoir utiliser un conteneur identique des années plus tard.

Sur le projet actuel, on utilise les nouvelles versions ce qui peut poser des problèmes sur le projet par la suite. Il est préférable d'utiliser la version utilisée lors de la création du projet.
<br />[docker gcc](https://hub.docker.com/_/gcc)
```
$ ./bin/terminal.sh
# gcc -v
gcc version 13.2.0 (GCC) 
```
Dand le fichier "**.docker/linux_agcc/Dockerfile**", remplacé '**latest**' par la bonne version disponible pour docker :
```
FROM gcc:latest
```
```
FROM gcc:13.2.0
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
