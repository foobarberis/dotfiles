#!/bin/sh
set -eu

copy_path() {
    src=$1
    dest=$2

    rm -rf "$dest"
    mkdir -p "$(dirname "$dest")"

    if [ -d "$src" ]; then
        mkdir -p "$dest"
        cp -Rfp "$src"/. "$dest"/
    else
        cp -fp "$src" "$dest"
    fi
}

mkdir -p \
    "$HOME/.config" \
    "$HOME/.emacs.d" \
    "$HOME/.local/bin" \
    "$HOME/.pi/agent/contexts" \
    "$HOME/.pi/agent/extensions" \
    "$HOME/.ssh/config.d" \
    "$HOME/.vim/colors" \
    "$HOME/.vim/plugin"

copy_path .bashrc "$HOME/.bashrc"
copy_path .bashrc "$HOME/.profile"
copy_path .bashrc "$HOME/.bash_profile"

copy_path .config/alacritty "$HOME/.config/alacritty"
copy_path .config/ghostty "$HOME/.config/ghostty"
copy_path .config/mpv "$HOME/.config/mpv"
copy_path .config/tmux "$HOME/.config/tmux"

copy_path .emacs.d "$HOME/.emacs.d"

copy_path gitconfig/.gitconfig "$HOME/.gitconfig"
copy_path gitconfig/.gitconfig-work "$HOME/.gitconfig-work"
copy_path gitconfig/.gitignore-global "$HOME/.gitignore-global"

copy_path .local/bin "$HOME/.local/bin"

copy_path .pi/agent/APPEND_SYSTEM.md "$HOME/.pi/agent/APPEND_SYSTEM.md"
copy_path .pi/agent/README.md "$HOME/.pi/agent/README.md"
copy_path .pi/agent/settings.json "$HOME/.pi/agent/settings.json"
copy_path .pi/agent/contexts "$HOME/.pi/agent/contexts"

copy_path .ssh/config.d "$HOME/.ssh/config.d"

copy_path .vim/colors "$HOME/.vim/colors"
copy_path .vim/plugin "$HOME/.vim/plugin"
copy_path .vim/vimrc "$HOME/.vim/vimrc"
copy_path .vim/vimrc "$HOME/.vimrc"

if [ -d "/mnt/c/Users/16018659" ]; then
    copy_path .config/alacritty "/mnt/c/Users/16018659/AppData/Roaming/alacritty"
    copy_path .vim "/mnt/c/Users/16018659/vimfiles"
fi
