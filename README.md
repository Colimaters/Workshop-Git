Workshop-Git
======================
F-PRO Workshop Git

Ce workshop a pour but de vous donner les bases de Git et de mettre en place des règles pour les messages de commit

## **Table of contents**
  - **Branches**
    - [introduction](#branches--introduction)
    - [develop](#branches--develop)
    - [1ère feature](#branches--1ère-feature)
    - [2ème feature](#branches--2ème-feature)
    - [merge et conflit](#branches--merge-et-conflit)
    - [code review](#branches--code-review)
  - **Commit message**
    - [introduction](#commit-message--introduction)
    - [Définition des types](#commit-message--définition-des-types)
    - [Taille du titre](#commit-message--taille-du-titre)
    - [Description du commit](#commit-message--description-du-commit)
    - [Finition](#commit-message--finition)
  - **Bonus**
    - [intégration](#bonus--intégration)
    - [le gitignore](#bonus--le-gitignore)

## **Branches : introduction**

Lors d'un projet en groupe, il est normal de travailler sur des parties différentes du programme à développer.

Pour s'organiser, il est plus qu'utile de bien séparer le travail dans des branches pour éviter de perdre du temps lors de conflit.

Nous allons donc simuler  un travail de groupe sur un projet simple de script.

> Créer un repository privé sur Github pour la suite des exercices

## **Branches : develop**

A chaque commencement de projet, nous allons devoir séparer la branch *main* de la branche pour développer.

La branche *main* ne devras jamais recevoir des push direct. Tout devras se faire via une pull request (pour vérifier le code).

Ainsi créer une branche du nom de *develop* qui vas concentrer tout le développement.

Dans cette branche, créer un fichier du nom de *script.sh* et push ce fichier sur git.

## **Branches : 1ère feature**
- **Fichier** : script.sh
- 
Maintenant que la base est faites, nous allons rajouter 2 fonctionnalités dans ce script.

Pour faire ça, il va falloir créer une branche du nom de "*feature/bonjour*".

Dans cette branche, nous allons modifier le fichier *script.sh*. Rajoutez dans le fichier la ligne suivante:

```sh
echo "Bonjour !"
```

Ensuite, il faut push les modifications apportez au fichier

## **Branches : 2ème feature**
- **Fichier** : script.sh
- 
Ensuite nous allons rajouter la 2nde fonctionnalité de ce script.

Pour faire ça, il va falloir créer une branche du nom de "*feature/politesse*".

Dans cette branche, nous allons modifier le fichier *script.sh*. rajouter dans le fichier la ligne suivante:

```sh
echo "J'espère que vous passez une bonne journée !"
```

Ensuite, il faut push les modifications apportez au fichier

## **Branches : merge et conflit**

Nos 2 fonctionnalités sont prêtes et fonctionnelles. Il est temps de les mettre dans la branche *develop*

Allez sur github et faites une pull request pour tirer les fonctionnalités de la branche "*feature/bonjour*" dans *develop*

Faites ensuite la même chose pour la branche "*feature/politesse*" dans *develop*

> Y a-t-il des erreurs ? Résolvez-les

## **Branches : code review**

A ce stade notre fichier *script.sh* contient les 2 fonctionnalités. C'est le moment de faire une pull request pour mettre notre programme dans *main*.

Le programme est fonctionnel donc il est possible de le mettre en production !

Faites une dernière pull request pour passer de *develop* à *main*

Cette fois-ci avant d'accepter la pull request, regardez les modifications apportés et mettez un commentaire.

En plus de ce commentaire, rajouter aussi un message global sur la pull request pour signifier que vous l'avez bien lu et que tout est fonctionnelle.

```




```

2ème partie
===================================

## **Commit message : introduction**

Afin de mettre en place des règles pour les messages de commit, nous allons utiliser les [Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks#_git_hooks) de git.

Et plus particulièrement le hooks *commit-msg* qui vas nous permettre de récupérer les éléments du messages de commit. Notamment le titre et la description.

> Quelques indications [ici](https://gist.github.com/robertpainsi/b632364184e70900af4ab688decf6f53)

Le fichier **commit-msg** contient déjà une base pour vous aiguillez et vous faciliter la tâche notamment en vérifiant le titre du commit avec un regex.

## **Commit message : Définition des types**
- **Fichier** : commit-msg

Dans le fichier **commit-msg**, vous allez modifier la valeur de la variable *commit_type* pour y mettre tout les types de commit que vous allez accepter.

> Nous recommandons d'en discuter avec vos camarades autour de vous pour définir quels sont les types de commit que vous faites le plus souvent.

Chacun de ces types devras être séparé par le charactère **|**, comme ceci:

```sh
commit_type="type1|type2|type3"
```

Parmis les types que vous aurez choisi, il devrait y avoir au moins (add, remove, update)

## **Commit message : Taille du titre**
- **Fichier** : commit-msg

Pour vous obligez à avoir un titre de commit court et concis, nous allons lui spécifier une taille maximale.

Vous avez de la chance la variable *count* contient déjà la taille du titre du commit.

Il ne vous reste qu'à rajouter à la fin de votre fichier une condition vérifiant si *count* est supérieur ou égal à 72.

Si c'est le cas, afficher un message d'erreur et sortez du programme avec une valeur de 1.

```sh
if [ CONDITION ]; then
	echo >&2 MESSAGE D\'ERREUR
	exit 1
fi
```

## **Commit message : Description du commit**
- **Fichier** : commit-msg

Un commit est composé d'un titre et d'une description.

Ainsi il est temps de vérifier si la description est vide ou non afin de faire savoir au développeur qu'il va devoir expliciter son commit.

Vous avez de la chance la variable *description* contient déjà la valeur de la description du commit.

Il ne vous reste qu'à rajouter à la fin de votre fichier une condition vérifiant si *description* est vide.

Si c'est le cas, afficher un message d'erreur et sortez du programme avec une valeur de 1.

```sh
if [ CONDITION ]; then
	echo >&2 MESSAGE D\'ERREUR
	exit 1
fi
```

## **Commit message : Finition**
- **Fichier** : commit-msg

Assurez vous que lorsqu'il y a une erreur de bien sortir du programme avec une valeur de 1.

De plus, rajouter des messages d'erreurs explicites pour indiquer ce que le développeur devras changer son commit.

Nous allons pouvoir rajouter à la fin du fichier un message de félicitations au développeur qui a bien suivi les règles.

```sh
echo "Bravo ! Continue comme ça !"
exit 0
```

## **Bonus : Intégration**
- **Fichier** : setup-repo.sh

Pour qu'à l'initialisation de votre repository vous disposiez de toute cette vérification, nous allons rajouter ce script dans le dossier ./git/hooks à la racine de votre repository.

Pour ça, créez une fonction dans votre fichier *setup-repo.sh* qui devras être appelé dans votre fonction *main*.

```sh
function setup_hooks()
{
    mv commit-msg .git/hooks/
}
```

## **Bonus : le gitignore**
- **Fichier** : setup-repo.sh

Pour qu'à l'initialisation de votre repository vous disposiez aussi d'un .gitignore, nous allons rajouter cette fonction dans **setup-repo.sh**.

Vous devrez l'appeler dans votre fonction *main*.

> [Ici](https://github.com/github/gitignore) pour voir la liste des gitignore disponibles

```sh
function get_gitignore()
{
    read -p "(gitignore) Enter the name of a language: " name

    if [ -z $name ] || [ $name -eq "" ]; then
        echo "Skip this part"
        return
    fi
    curl -o .gitignore "https://raw.githubusercontent.com/github/gitignore/main/$name.gitignore"
}
```