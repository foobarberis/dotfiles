#!/bin/sh
set -eu

# Ensure destination directories exist
mkdir -p \
    "$HOME/.local/bin" \
    "$HOME/.vim/colors" \
    "$HOME/.config/alacritty" \
    "$HOME/.config/nvim/colors" \
    "$HOME/.config/nvim" \
    "$HOME/.ssh"

# Deploy shell configuration
cp .bashrc "$HOME/.bashrc"
cp .bashrc "$HOME/.profile"
cp .bashrc "$HOME/.bash_profile"

# Deploy Vim/Neovim configuration
cp .vimrc "$HOME/.vimrc"
cp .vimrc "$HOME/.config/nvim/init.vim"
cp berkeley-light.vim "$HOME/.vim/colors/berkeley-light.vim"
cp berkeley-light.vim "$HOME/.config/nvim/colors/berkeley-light.vim"

# Deploy entire .config folder contents
cp -Rfp .config/. "$HOME/.config/"
cp .config/alacritty/alacritty.toml .config/alacritty/berkeley-light.toml "$HOME/.config/alacritty/"

windows_alacritty_dir='/mnt/c/Users/16018659/OneDrive - bioMerieux/Documents/PARA/3 Resources/(R) Software/Alacritty'
if [ -d "$windows_alacritty_dir" ]; then
    cp .config/alacritty/alacritty.toml .config/alacritty/berkeley-light.toml "$windows_alacritty_dir/"
fi

# Deploy local binaries (if any)
if [ -d .local/bin ]; then
    find .local/bin -mindepth 1 -maxdepth 1 -type f -exec cp -fp {} "$HOME/.local/bin/" \;
fi
