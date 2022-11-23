#! /bin/bash

function get_gitignore()
{
    read -p "(gitignore) Enter the name of a language: " name

    if [ -z $name ] || [ $name -eq "" ]; then
        echo "Skip this part"
        return
    fi
    curl -o .gitignore "https://raw.githubusercontent.com/github/gitignore/main/$name.gitignore"
}

function setup_hooks()
{
    cp solution/commit-msg .git/hooks/
}

function main()
{
    get_gitignore
    setup_hooks
}

main