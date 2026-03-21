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
    "$HOME/.config" \
    "$HOME/.pi"

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

if [ -d .pi/agent ]; then
    mkdir -p \
        "$HOME/.pi/agent" \
        "$HOME/.pi/agent/contexts" \
        "$HOME/.pi/agent/extensions"

    cp -fp .pi/agent/APPEND_SYSTEM.md "$HOME/.pi/agent/APPEND_SYSTEM.md"
    cp -fp .pi/agent/README.md "$HOME/.pi/agent/README.md"
    cp -fp .pi/agent/settings.json "$HOME/.pi/agent/settings.json"
    cp -fp .pi/agent/presets.json "$HOME/.pi/agent/presets.json"
    cp -fp .pi/agent/contexts/coder.md "$HOME/.pi/agent/contexts/coder.md"
    cp -fp .pi/agent/contexts/teacher.md "$HOME/.pi/agent/contexts/teacher.md"
    cp -fp .pi/agent/extensions/preset.ts "$HOME/.pi/agent/extensions/preset.ts"
fi

