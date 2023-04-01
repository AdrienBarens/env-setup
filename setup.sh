#!/bin/sh

echo "=============== Env Setup ==============="

# Install requirements
./scripts/requirements.sh

echo ""

# Install playbook
ansible-playbook -i "localhost," -c local playbook.yml

echo ""

# Setup Git
./scripts/gitconfig.sh

echo ""

# Setup ssh
./scripts/ssh.sh

echo "\n--- Clean setup ---"

echo "Remove python version installed via brew..."
brew uninstall python@3.10

echo "\n=============== Setup completed ==============="