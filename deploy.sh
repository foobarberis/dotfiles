#!/bin/sh

# Create necessary directories if they do not exist
mkdir -p ${HOME}/.ssh \
         ${HOME}/.local/bin \
         ${HOME}/.config/alacritty \
         ${FOLDER_FILES} \
         ${FOLDER_DOCUMENTS} \
         ${FOLDER_CODE} \
         ${FOLDER_AUDIO} \
         ${FOLDER_VIDEO} \
         ${FOLDER_PICTURES} \
         ${FOLDER_GAMES} 

# On macOS .bash_profile is read instead of .bashrc
cp .bashrc ${HOME}/.bash_profile
cp .bashrc ${HOME}/.profile

# Deploy dotfiles
cp .env .bashrc .bash_aliases .tmux.conf .vimrc ${HOME}

# Deploy configuration for Alacritty Unix-based systems 
cp alacritty.toml ${HOME}/.config/alacritty/alacritty.toml

# Deploy configuration for Alacritty on Windows
# cp alacritty.toml /mnt/c/Users/16018659/AppData/Roaming/alacritty 

# Deploy personal scripts
chmod +x ./bin/* && cp ./bin/* ~/.local/bin

# Deploy SSH configuration
cp ssh_config ${HOME}/.ssh/config
