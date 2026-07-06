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
    "$HOME/.emacs.terminal.d" \
    "$HOME/.local/bin" \
    "$HOME/.pi/agent" \
    "$HOME/.pi/agent/extensions" \
    "$HOME/.pi/agent/skills" \
    "$HOME/.ssh/config.d" \
    "$HOME/.vim/colors" \
    "$HOME/.vim/plugin"

copy_path .bashrc "$HOME/.bashrc"
copy_path .bashrc "$HOME/.profile"
copy_path .bashrc "$HOME/.bash_profile"

copy_path .config/alacritty "$HOME/.config/alacritty"
copy_path .config/ghostty/config.ghostty "$HOME/.config/ghostty/config.ghostty"
copy_path .config/mpv/mpv.conf "$HOME/.config/mpv/mpv.conf"
copy_path .config/tmux "$HOME/.config/tmux"

copy_path .emacs.d "$HOME/.emacs.d"
copy_path .emacs.terminal.d "$HOME/.emacs.terminal.d"

copy_path gitconfig/.gitconfig "$HOME/.gitconfig"
copy_path gitconfig/.gitconfig-work "$HOME/.gitconfig-work"
copy_path gitconfig/.gitignore-global "$HOME/.gitignore-global"

copy_path .local/bin "$HOME/.local/bin"

rm -f "$HOME/.pi/agent/APPEND_SYSTEM.md"
rm -rf "$HOME/.pi/agent/contexts"
copy_path .pi/agent/README.md "$HOME/.pi/agent/README.md"
copy_path .pi/agent/settings.json "$HOME/.pi/agent/settings.json"
copy_path .pi/agent/SYSTEM.md "$HOME/.pi/agent/SYSTEM.md"
for skill in .pi/agent/skills/*; do
    [ -e "$skill" ] || continue
    copy_path "$skill" "$HOME/.pi/agent/skills/$(basename "$skill")"
done

copy_path .ssh/config.d "$HOME/.ssh/config.d"

copy_path .vim/colors "$HOME/.vim/colors"
copy_path .vim/plugin "$HOME/.vim/plugin"
copy_path .vim/vimrc "$HOME/.vim/vimrc"

if [ -d "/mnt/c/Users/16018659" ]; then
    copy_path .config/alacritty "/mnt/c/Users/16018659/AppData/Roaming/alacritty"
    copy_path .vim "/mnt/c/Users/16018659/vimfiles"
fi
