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

windows_alacritty_dir=${WINDOWS_ALACRITTY_DIR:-}
windows_vim_dir=${WINDOWS_VIM_DIR:-}

# If running under WSL, resolve the Windows home directory and deploy there.
if [ -z "$windows_alacritty_dir" ] || [ -z "$windows_vim_dir" ]; then
    if command -v wslpath >/dev/null 2>&1 && command -v cmd.exe >/dev/null 2>&1; then
        win_home=$(cmd.exe /c "echo %USERPROFILE%" 2>/dev/null | tr -d '\r')
        win_home_u=$(wslpath -u "$win_home" 2>/dev/null || true)

        if [ -n "$win_home_u" ]; then
            : "${windows_alacritty_dir:=$win_home_u/AppData/Roaming/alacritty}"
            : "${windows_vim_dir:=$win_home_u/vimfiles}"
        fi
    fi
fi

# Fallback (e.g. Git Bash/Cygwin). This path will be a no-op on Linux.
: "${windows_alacritty_dir:=C:\\Users\\16018659\\AppData\\Roaming\\alacritty}"
: "${windows_vim_dir:=C:\\Users\\16018659\\vimfiles}"

if [ -d "$windows_alacritty_dir" ] && [ -d .config/alacritty ]; then
    cp -Rfp .config/alacritty/. "$windows_alacritty_dir/"
fi

if [ -d "$windows_vim_dir" ] && [ -d .vim ]; then
    cp -Rfp .vim/. "$windows_vim_dir/"
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
    cp -fp .pi/agent/contexts/coder-system.md "$HOME/.pi/agent/contexts/coder-system.md"
    cp -fp .pi/agent/contexts/teacher-system.md "$HOME/.pi/agent/contexts/teacher-system.md"
fi

