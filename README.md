# Setup a new dev env for MacOS

This repository contains a set of scripts and ansible playbooks to setup a new development environment on MacOS. It's designed to be run on a fresh install of MacOS, and will install a range of basic tools and utilities that I use on a daily basis.

## Getting Started

To get started, clone this repository to your local machine and run the setup script:

```bash
./setup.sh
```

This will install all the pre-requisites needed to run the ansible playbooks, and then run the playbooks to install all the tools and utilities. The setup script will also help to setup your git and a ssh key.

## What's installed?

Applications:
- Docker
- Firefox
- Iterm2
- MonitorControl
- Visual Studio Code

Packages:
- btop
- oh-my-zsh
- pyenv
- pyenv-virtualenv
- starship