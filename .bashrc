if [ -f ~/.env ]; then
	. ~/.env
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable vi-mode and re-bind Ctrl-L to clear
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Automatically correct mistyped 'cd' directories
shopt -s cdspell

# Attempts spelling correction on directory names during word completion
shopt -s dirspell

# Append to history file; do not overwrite
shopt -s histappend

# Prevent accidental overwrites when using IO redirection
set -o noclobber
