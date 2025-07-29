#!/bin/sh

mkdir -p ${HOME}/.ssh ${HOME}/.local/bin ${HOME}/.config/alacritty/ ${HOME}/.config/tmux ${HOME}/.config/nvim

cp ./.bashrc ${HOME}
cp ./.bashrc ${HOME}/.profile
cp ./.bashrc ${HOME}/.bash_profile

cp ./.vimrc ${HOME}
cp ./.vimrc ${HOME}/.config/nvim/init.vim

cp ./.ssh/config ${HOME}/.ssh/
cp ./.config/tmux/tmux.conf ${HOME}/.config/tmux/
cp ./.config/alacritty/alacritty.toml ${HOME}/.config/alacritty/

cp ./.local/bin/* ${HOME}/.local/bin

