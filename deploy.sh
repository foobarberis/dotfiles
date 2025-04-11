#!/bin/sh

mkdir -p ${HOME}/.config/alacritty

cp .bashrc .bash_aliases .tmux.conf .vimrc ${HOME}
cp alacritty.toml ${HOME}/.config/alacritty/alacritty.toml
# cp alacritty.toml /mnt/c/Users/16018659/AppData/Roaming/alacritty 

chmod +x ./bin/* && sudo cp ./bin/* /usr/local/bin
