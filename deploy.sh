#!/bin/sh
set -eu

# Ensure destination directories exist
mkdir -p "$HOME/.local/bin" "$HOME/.config/nvim" "$HOME/.ssh"

# Deploy shell configuration
cp .bashrc "$HOME/.bashrc"
cp .bashrc "$HOME/.profile"
cp .bashrc "$HOME/.bash_profile"

# Deploy Vim/Neovim configuration
cp .vimrc "$HOME/.vimrc"
cp .vimrc "$HOME/.config/nvim/init.vim"

# Deploy entire .config folder contents
cp -Rfp .config/. "$HOME/.config/"

# Deploy local binaries (if any)
if [ -d .local/bin ]; then
    find .local/bin -mindepth 1 -maxdepth 1 -type f -exec cp -fp {} "$HOME/.local/bin/" \;
fi

# Deploy SSH configuration
if [ -f .ssh/config ]; then
    cp -fp .ssh/config "$HOME/.ssh/config"
    chmod 600 "$HOME/.ssh/config"
fi

