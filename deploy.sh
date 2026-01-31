#!/bin/sh

# Ensure destination directories exist
mkdir -p ${HOME}/.local/bin ${HOME}/.config/nvim

# Deploy shell configuration
cp .bashrc ${HOME}
cp .bashrc ${HOME}/.profile
cp .bashrc ${HOME}/.bash_profile

# Deploy Vim/Neovim configuration
cp .vimrc ${HOME}
cp .vimrc ${HOME}/.config/nvim/init.vim

# Deploy entire .config folder
cp -Rfp .config/ ${HOME}/.config/

# Deploy local binaries
cp .local/bin/* ${HOME}/.local/bin
