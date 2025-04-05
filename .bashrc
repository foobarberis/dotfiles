if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export FZF_DEFAULT_COMMAND='find .'

export PATH="$PATH:/usr/sbin:/sbin:/bin:/usr/bin:/etc:/usr/ucb:/usr/local/bin:/usr/local/local_dfs/bin:/usr/bin/X11:/usr/local/sas:$HOME/.scripts/:$HOME/.local/bin:/usr/local/bin/:/opt/nvim-linux-x86_64/bin"

export MANPATH="/usr/share/man:/usr/local/man:/usr/local/local_dfs/man"

export PAGER=less

## The maximum number of lines in your history file
export HISTFILESIZE=1000

## Automatically correct mistyped 'cd' directories
shopt -s cdspell

## Append to history file; do not overwrite
shopt -s histappend

## Prevent accidental overwrites when using IO redirection
set -o noclobber

alias fed='nvim $(fzf)'
alias fcd='cd $(ls -d */ | fzf)'
alias fopen='open $(find . | fzf)'

# Personal PS1
PS1='\[\e[0m\]\W \[\e[0m\]$ \[\e[0m\]'
