#!/bin/sh

NVIM_CONF_DIR=".config/nvim/"
ALAC_CONF_DIR=".config/alacritty/"
TMUX_CONF_DIR=".config/tmux/"
ROAMING_DIR="/mnt/c/Users/16018659/AppData/Roaming"

# Create necessary directories if they do not exist
mkdir -p "${HOME}/.ssh" \
         "${HOME}/.local/bin" \
         "${NVIM_CONF_DIR}" \
         "${ALAC_CONF_DIR}" \
         "${FOLDER_FILES}" \
         "${FOLDER_DOCUMENTS}" \
         "${FOLDER_CODE}" \
         "${FOLDER_AUDIO}" \
         "${FOLDER_VIDEO}" \
         "${FOLDER_PICTURES}" \
         "${FOLDER_GAMES}"

# On macOS .bash_profile is read instead of .bashrc
cp .bashrc "${HOME}/.bash_profile"
cp .bashrc "${HOME}/.profile"

# Deploy dotfiles
cp .env .bashrc .bash_aliases .vimrc "${HOME}"

# Deploy Alacritty configuration
rsync -a --delete "${ALAC_CONF_DIR}" "${HOME}/${ALAC_CONF_DIR}" 
if [ -d "${ALAC_CONF_DIR_WINDOWS}" ]; then
  ALAC_CONF_DIR_WINDOWS="${ROAMING_DIR}/alacritty/"
  mkdir -p "${ALAC_CONF_DIR_WINDOWS}"
  rsync -a --delete "${ALAC_CONF_DIR}" "${ALAC_CONF_DIR_WINDOWS}"
fi

# Deploy Neovim configuration
rsync -a --delete "${NVIM_CONF_DIR}" "${HOME}/${NVIM_CONF_DIR}" 

# Deploy Tmux configuration
rsync -a --delete "${TMUX_CONF_DIR}" "${HOME}/${TMUX_CONF_DIR}" 

# Deploy personal scripts
chmod +x ./bin/* && cp ./bin/* "${HOME}/.local/bin"

# Deploy SSH configuration
cp ssh_config "${HOME}/.ssh/config"
