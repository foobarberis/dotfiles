#!/bin/sh

mkdir -p ${HOME}/.config/alacritty

# On macOS .bash_profile is read instead of .bashrc
cp .bashrc ~/.bash_profile

# Deploy dotfiles
cp .bashrc .bash_aliases .tmux.conf .vimrc ${HOME}

# Deploy configuration for Alacritty Linux / macOS
cp alacritty.toml ${HOME}/.config/alacritty/alacritty.toml

# Deploy configuration for Alacritty on Windows
# cp alacritty.toml /mnt/c/Users/16018659/AppData/Roaming/alacritty 

# Deploy personal scripts
chmod +x ./bin/* && sudo cp ./bin/* /usr/local/bin
