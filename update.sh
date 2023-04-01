#!/bin/sh

echo "Updating ansible playbook..."

# Check if ansible is installed
if test ! $(which ansible); then
    echo "  Ansible not installed, installing..."
    pip install ansible
else
    echo "  Ansible already installed, skipping..."
fi

# Launch playbook
ansible-playbook -i "localhost," -c local playbook.yml