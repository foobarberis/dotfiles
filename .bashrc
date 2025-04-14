if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Function to add directories to PATH if they exist
add_to_path() {
    for dir in "$@"; do
        if [ -d "$dir" ] && [[ ":$PATH:" != *":$dir:"* ]]; then
            PATH="$dir:$PATH"
        fi
    done
}

# Add desired directories
add_to_path /usr/local/bin
add_to_path /opt/homebrew/bin

export PATH

# Set locale
# Might require you to run `sudo locale-gen en_US.UTF-8`
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Set the default command used by fzf
export FZF_DEFAULT_COMMAND='find .'

# Set editor
export EDITOR="nvi"

# Set pager
export PAGER=less

# Enable vi-mode and re-bind Ctrl-L to clear
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Set unlimited history and define history format
export HISTSIZE= 
export HISTFILESIZE=
export HISTTIMEFORMAT="%F %T "

# Automatically correct mistyped 'cd' directories
shopt -s cdspell

# Attempts spelling correction on directory names during word completion
shopt -s dirspell

# Append to history file; do not overwrite
shopt -s histappend

# Prevent accidental overwrites when using IO redirection
set -o noclobber

# Personal PS1
PS1='\[\e[0m\]\W \[\e[0m\]$ \[\e[0m\]'
