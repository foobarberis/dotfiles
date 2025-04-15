#!/bin/sh

mkdir -p ${HOME}/.config/alacritty

# On macOS .bash_profile is read instead of .bashrc
cp .bashrc ~/.bash_profile

# Deploy dotfiles
cp .bashrc .bash_aliases .tmux.conf .vimrc .exrc ${HOME}

# Deploy configuration for Alacritty Unix-based systems 
cp alacritty.toml ${HOME}/.config/alacritty/alacritty.toml

# Deploy configuration for Alacritty on Windows
# cp alacritty.toml /mnt/c/Users/16018659/AppData/Roaming/alacritty 

# Deploy personal scripts
chmod +x ./bin/* && sudo cp ./bin/* /usr/local/bin

# Source .bashrc and .bash_aliases in all of the splits in all of the windows.
tmux list-windows -F '#{window_id}' | while read window; do
    tmux list-panes -t "$window" -F '#{pane_id}' | while read pane; do
		tmux send-keys -t "$pane" "source ~/.bashrc" Enter
		tmux send-keys -t "$pane" "source ~/.bash_aliases" Enter
	done
done
