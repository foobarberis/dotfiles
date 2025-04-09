#!/bin/sh

mkdir -p ${HOME}/.config/alacritty

cp .bashrc ${HOME}/.bashrc
cp .bash_aliases ${HOME}/.bash_aliases
cp .tmux.conf ${HOME}/.tmux.conf
cp .vimrc ${HOME}/.vimrc
cp alacritty.toml ${HOME}/.config/alacritty/alacritty.toml
