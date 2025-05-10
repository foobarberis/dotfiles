#!/bin/sh

# Create necessary directories if they do not exist
mkdir -p "${HOME}/.ssh" \
         "${HOME}/.local/bin" \
         "${FOLDER_FILES}" \
         "${FOLDER_DOCUMENTS}" \
         "${FOLDER_CODE}" \
         "${FOLDER_AUDIO}" \
         "${FOLDER_VIDEO}" \
         "${FOLDER_PICTURES}" \
         "${FOLDER_GAMES}" \
         "${HOME}/.config/nvim" \
         "${HOME}/.config/tmux" \
         "${HOME}/.config/alacritty"

# On macOS .bash_profile is read instead of .bashrc
cp .bashrc "${HOME}/.bash_profile"
cp .bashrc "${HOME}/.profile"

# Deploy dotfiles
cp .bashrc .bash_aliases .vimrc "${HOME}"

# Deploy Alacritty configuration for Linux / macOS
cp ./.config/alacritty/alacritty.toml ~/.config/alacritty/

# Deploy Alacritty configuration for Windows
ROAMING_DIR="/mnt/c/Users/16018659/AppData/Roaming"
if [ -d "${ROAMING_DIR}" ]; then
  mkdir -p "${ROAMING_DIR}/alacritty/"
  cp ./.config/alacritty/alacritty.toml ${ROAMING_DIR}/alacritty/
fi

# Deploy Vim configuration
cp ./.vimrc "${HOME}"/
cp ./.vimrc ~/.config/nvim/init.vim

# Deploy Tmux configuration
cp ./.config/tmux/tmux.conf ~/.config/tmux/

# Deploy personal scripts
chmod +x ./bin/* && cp ./bin/* "${HOME}/.local/bin"

# Deploy SSH configuration
cp ssh_config "${HOME}/.ssh/config"
