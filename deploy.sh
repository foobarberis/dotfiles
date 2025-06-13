#!/bin/bash

set -euo pipefail  # Safer bash behavior: exit on error, unset vars, or pipe failure

# Create necessary directories if they do not exist
mkdir -p "${HOME}/.ssh" \
         "${HOME}/.local/bin" \
         "${HOME}/.emacs.d" \
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

# Deploy dotfiles
cp .bashrc .bash_aliases .vimrc "${HOME}/"

# On macOS, .bash_profile and .profile are sourced instead of .bashrc
cp .bashrc "${HOME}/.bash_profile"
cp .bashrc "${HOME}/.profile"

# Deploy Alacritty configuration for Linux/macOS
cp ./.config/alacritty/alacritty.toml "${HOME}/.config/alacritty/"

# Deploy Alacritty configuration for Windows (via WSL)
# ROAMING_DIR="/mnt/c/Users/16018659/AppData/Roaming"
# if [ -d "${ROAMING_DIR}" ]; then
#     mkdir -p "${ROAMING_DIR}/alacritty/"
#     cp ./.config/alacritty/alacritty.toml "${ROAMING_DIR}/alacritty/"
# fi

# Deploy Vim configuration
cp .vimrc "${HOME}/"

# Deploy Tmux configuration
cp ./.config/tmux/tmux.conf "${HOME}/.config/tmux/"

# Deploy Emacs configuration (copy contents, not the folder itself)
cp -r .emacs.d/* "${HOME}/.emacs.d/"

# Deploy personal scripts
chmod +x ./bin/*
cp ./bin/* "${HOME}/.local/bin/"

# Deploy SSH configuration
cp ssh_config "${HOME}/.ssh/config"

# Define the list of target directories
TARGET_DIRECTORIES="
    ${FOLDER_3PC}/3pc-web-back
    ${FOLDER_3PC}/3pc-devops
    ${FOLDER_3PC}/3pc-web-front
    ${FOLDER_3PC}/3pc-installer
    ${FOLDER_3PC}/mirrhia-etl
    ${FOLDER_3PC}/mirrhia-hub
    ${FOLDER_3PC}/mirrhia-report
    ${FOLDER_3PC}/microbio-connectivity
"

# Path to the Git hook file
HOOK_FILE="./bin/prepare-commit-msg"

# Iterate through each directory and deploy the Git hook
for DIR in $TARGET_DIRECTORIES; do
    if [ ! -d "$DIR" ]; then
        continue
    fi

    if [ -d "$DIR/.git" ]; then
        cp "$HOOK_FILE" "$DIR/.git/hooks/"
        chmod +x "$DIR/.git/hooks/prepare-commit-msg"
        echo "Hook deployed to $DIR"
    else
        echo "$DIR is not a Git repository"
    fi
done
