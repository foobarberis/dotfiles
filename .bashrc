if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export PATH="$PATH:/usr/sbin:/sbin:/bin:/usr/bin:/etc:/usr/ucb:/usr/local/bin:/usr/local/local_dfs/bin:/usr/bin/X11:/usr/local/sas:$HOME/.scripts/:$HOME/.local/bin:/usr/local/bin/"

export MANPATH="/usr/share/man:/usr/local/man:/usr/local/local_dfs/man"

export FZF_DEFAULT_COMMAND='find .'

export PAGER=less

# Set unlimited history
export HISTSIZE= 
export HISTFILESIZE=

# Automatically correct mistyped 'cd' directories
shopt -s cdspell

# Append to history file; do not overwrite
shopt -s histappend

# Prevent accidental overwrites when using IO redirection
set -o noclobber

# Personal PS1
PS1='\[\e[0m\]\W \[\e[0m\]$ \[\e[0m\]'
