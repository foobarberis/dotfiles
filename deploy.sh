#!/bin/sh

mkdir -p ${HOME}/.config/alacritty

# On macOS .bash_profile is read instead of .bashrc
cp .bashrc ${HOME}/.bash_profile

# Deploy dotfiles
cp .bashrc .bash_aliases .tmux.conf .vimrc .exrc ${HOME}

# Deploy configuration for Alacritty Unix-based systems 
cp alacritty.toml ${HOME}/.config/alacritty/alacritty.toml

# Deploy configuration for Alacritty on Windows
# cp alacritty.toml /mnt/c/Users/16018659/AppData/Roaming/alacritty 

# Deploy personal scripts
chmod +x ./bin/* && sudo cp ./bin/* /usr/local/bin

tmux list-windows -F '#{window_id}' | while read window; do
    tmux list-panes -t "$window" -F '#{pane_id}' | while read pane; do
        # Directly pipe commands into the pane's environment
        tmux pipe-pane -t "$pane" -o 'exec source ~/.bashrc && source ~/.bash_aliases'
    done
done
