#!/bin/sh

# Create necessary folders if they do not yet exist
mkdir -p $FOLDER_HOME $FOLDER_CODE $FOLDER_3PC $FOLDER_FILES $FOLDER_AUDIO $FOLDER_VIDEO $FOLDER_GAMES $FOLDER_PICTURES
mkdir -p ${HOME}/.config/alacritty
mkdir -p ${HOME}/.ssh

# On macOS .bash_profile is read instead of .bashrc
cp .bashrc ${HOME}/.bash_profile
cp .bashrc ${HOME}/.profile

# Deploy dotfiles
cp .gitconfig .env .bashrc .bash_aliases .tmux.conf .exrc .vimrc ${HOME}

# Deploy configuration for Alacritty Unix-based systems 
cp alacritty.toml ${HOME}/.config/alacritty/alacritty.toml

# Deploy configuration for Alacritty on Windows
# cp alacritty.toml /mnt/c/Users/16018659/AppData/Roaming/alacritty 

# Deploy personal scripts
chmod +x ./bin/* && sudo cp ./bin/* /usr/local/bin

# Deploy SSH configuration
cp ssh_config ${HOME}/.ssh/config
