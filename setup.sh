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

echo "=============== Setup completed ==============="