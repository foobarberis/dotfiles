#!/bin/sh
set -eu

replace_path() {
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
    "$HOME/.local" \
    "$HOME/.config"

cp -fp .bashrc "$HOME/.bashrc"
cp -fp .bashrc "$HOME/.profile"
cp -fp .bashrc "$HOME/.bash_profile"

rm -f "$HOME/.vimrc"
cat > "$HOME/.vimrc" <<'EOF'
if filereadable(expand('~/.vim/vimrc'))
  source ~/.vim/vimrc
endif
EOF
replace_path .vim "$HOME/.vim"

if [ -d .config ]; then
    find .config -mindepth 1 -maxdepth 1 | while IFS= read -r src; do
        name=${src##*/}
        replace_path "$src" "$HOME/.config/$name"
    done
fi

windows_alacritty_dir='/mnt/c/Users/16018659/OneDrive - bioMerieux/Documents/PARA/3 Resources/(R) Software/Alacritty'
if [ -d "$windows_alacritty_dir" ] && [ -d .config/alacritty ]; then
    cp -Rfp .config/alacritty/. "$windows_alacritty_dir/"
fi

if [ -d .local/bin ]; then
    replace_path .local/bin "$HOME/.local/bin"
fi

