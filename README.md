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

blabla

## **Branches : develop**

## **Branches : 1ère feature**

## **Branches : 2ème feature**

## **Branches : merge et conflit**

## **Branches : code review**

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