#!/bin/sh

echo "=============== Setup SSH ==============="

echo "1. Check if SSH is installed"

if test ! $(which ssh); then
    echo "  Installing SSH for you."
    brew install ssh
else
    echo "  SSH already installed, skipping..."
fi

echo "2. Check if there is already a SSH key"

if [ ! -f ~/.ssh/id_ed25519.pub ]; then
    echo "  No SSH key found, generating one..."
    echo "\nCreating a new SSH key for you..."
    read -p "Enter your email: " email
    ssh-keygen -t ed25519 -C $email
else
    echo "  SSH key found, skipping..."
fi

echo "3. Add SSH key to the ssh-agent"

echo "  Check if config file exists"

if [ ! -f ~/.ssh/config ]; then
    echo "    Config file not found, creating one..."
    touch ~/.ssh/config
    cat ../config/ssh_agent > ~/.ssh/config

    eval "$(ssh-agent -s)"
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
else
    echo "    Config file found, skipping..."
fi

echo "4. Copy SSH key to clipboard"

pbcopy < ~/.ssh/id_ed25519.pub

echo "=============== End Setup SSH ==============="