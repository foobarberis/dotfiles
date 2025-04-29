#!/bin/sh

NVIM_CONFIG_DIR=${HOME}/.config/nvim
ALACRITTY_CONFIG_DIR_UNIX=${HOME}/.config/alacritty
ALACRITTY_CONFIG_DIR_WINDOWS=/mnt/c/Users/16018659/AppData/Roaming/alacritty 

# Create necessary directories if they do not exist
mkdir -p ${HOME}/.ssh \
         ${HOME}/.local/bin \
         ${NVIM_CONFIG_DIR} \
         ${ALACRITTY_CONFIG_DIR_UNIX} \
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

# Deploy Alacritty configuration
cp alacritty.toml ${ALACRITTY_CONFIG_DIR_UNIX}
if [ -d "${ALACRITTY_CONFIG_DIR_UNIX}" ]; then
  cp alacritty.toml ${ALACRITTY_CONFIG_DIR_WINDOWS}
fi

# Deploy Neovim configuration
cp init.lua ${NVIM_CONFIG_DIR}

# Deploy personal scripts
chmod +x ./bin/* && cp ./bin/* ~/.local/bin

# Deploy SSH configuration
cp ssh_config ${HOME}/.ssh/config
