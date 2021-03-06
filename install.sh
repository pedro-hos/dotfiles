#!/bin/bash

cd "$(dirname "$0")"

function install() {
    rsync \
        --exclude "*.swp" \
        --exclude "*~" \
        --exclude ".git/" \
        --exclude ".gitignore" \
        --exclude "README.md" \
        --exclude "install.sh" \
        --exclude "prepare_environment.sh" \
        -av . ~
}

if [[ $1 =~ ^(-f|--force)$ ]]; then
    install
else
    read -p "Running this file, you'll override some config files. Do you want to continue? (y/n) "

    if [[ $REPLY =~ ^[yY]$ ]]; then
        install
    fi
fi
