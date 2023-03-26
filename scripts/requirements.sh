#!/bin/sh

check_response_rosetta () {
    read -p "Do you want to install rosetta? [y/n]: " rosetta
    if [[ $rosetta != "y" ]] && [[ $rosetta != "n" ]]; then
        echo "/!\ Response is not valid /!\\"
        echo "Please enter a valid response"
        check_response_rosseta
    fi
}

echo "=============== Install requirements ==============="

echo "1. Install Xcode Command Line Tools"
if [[ $(xcode-select -p) == "" ]];
then
    xcode-select --install
else
    echo "Xcode Command Line Tools is already installed"
fi

check_response_rosetta
if [[ $rosetta == "y" ]]; then
    echo "Installing Rosetta..."
    softwareupdate --install-rosetta --agree-to-license
fi

echo "\n2. Install Homebrew"
if [[ $(command -v brew) == "" ]];
then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed"
    echo "Updating Homebrew..."
    brew update
fi

echo "\n3. Install Python 3"
if [[ $(command -v python3) == "" ]];
then
    echo "Installing Python 3.10 ..."
    brew install python@3.10
else
    echo "Python 3 is already installed"
    echo "Updating Python 3..."
    brew upgrade python
fi

echo "\n4. Install ansible package"
pip3 install --ignore-installed ansible

echo "=============== End install requirements ==============="