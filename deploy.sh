#!/usr/bin/env bash

set -euo pipefail

# The directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Files and directories to symlink
# This list contains paths relative to the dotfiles directory
# The script will symlink them to the corresponding path in $HOME
FILES_TO_LINK=(
    ".bashrc"
    ".vimrc"
    ".ssh/config"
    ".config/alacritty/alacritty.toml"
    ".config/tmux/tmux.conf"
    ".local/bin"
)

main() {
    echo "Starting dotfiles deployment..."

    for item in "${FILES_TO_LINK[@]}"; do
        local source_path="${DOTFILES_DIR}/${item}"
        local target_path="${HOME}/${item}"

        if [ ! -e "$source_path" ]; then
            echo "ERROR: Source file/directory does not exist: ${source_path}"
            continue
        fi

        # Create parent directory for the target if it doesn't exist
        mkdir -p "$(dirname "${target_path}")"

        # If the target already exists, back it up
        if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
            echo "Backing up existing ${target_path} to ${target_path}.bak"
            mv "$target_path" "${target_path}.bak"
        fi

        # Remove existing symlink if it points to the wrong place
        if [ -L "$target_path" ]; then
            rm "$target_path"
        fi

        # Create the symlink
        echo "Linking ${source_path} to ${target_path}"
        ln -s "$source_path" "$target_path"
    done

    echo "Deployment complete!"
}

main
