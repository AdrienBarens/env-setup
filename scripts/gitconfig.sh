#!/bin/sh

check_email () {
    if ! [[ $email =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then
        echo "/!\ Email is not valid /!\\"
        echo "Please enter a valid email"
        read -p "Enter your email: " email
        check_email
    fi
}

setup_global_gitignore () {
    echo "4. Load global .gitignore"

    if [ ! -f ~/.gitignore_global ]; then
        touch ~/.gitignore_global
    fi

    cat ../config/default_gitignore.txt > ~/.gitignore_global
}

display_summary () {
    echo "\n-- Summary --"
    echo "version: $GIT_VERSION"
    echo "user name: $(git config --global user.name)"
    echo "user email: $(git config --global user.email)"
    echo "user editor: $(git config --global core.editor)"
    echo "global .gitignore path: $(git config --global core.excludesfile)"
}

echo "=============== Setup Git ==============="

GIT_VERSION="$(git --version)"

if [ "$GIT_VERSION" != "command not found" ]; then
    echo "1. Set user name"
    read -p "Enter your name: " name
    git config --global user.name "$name"

    echo "2. Set user email"
    read -p "Enter your email: " email
    check_email
    git config --global user.email "$email"

    echo "3. Set user editor"
    read -p "Enter your editor: " editor
    git config --global core.editor "$editor"

    setup_global_gitignore
    git config --global core.excludesfile ~/.gitignore_global

    display_summary
else
    echo "Git not found"
    echo "Please install git first"
fi

echo "=============== End Setup Git ==============="