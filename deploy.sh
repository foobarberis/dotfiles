#!/bin/sh

I3_DIR=$HOME/.config/i3

mkdir -p $I3_DIR

cp config $I3_DIR
cp .xinitrc .Xresources .bash_profile .bashrc .tmux.conf .vimrc $HOME
