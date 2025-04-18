#!/bin/sh

mkdir -p ${HOME}/.config/alacritty
mkdir -p ${HOME}/.ssh

# On macOS .bash_profile is read instead of .bashrc
cp .bashrc ${HOME}/.bash_profile

# Deploy dotfiles
cp .gitconfig .env .bashrc .bash_aliases .tmux.conf .vimrc .exrc ${HOME}

# Deploy configuration for Alacritty Unix-based systems 
cp alacritty.toml ${HOME}/.config/alacritty/alacritty.toml

# Deploy configuration for Alacritty on Windows
# cp alacritty.toml /mnt/c/Users/16018659/AppData/Roaming/alacritty 

# Deploy personal scripts
chmod +x ./bin/* && sudo cp ./bin/* /usr/local/bin

# Deploy SSH configuration
cp ssh_config ${HOME}/.ssh/config
