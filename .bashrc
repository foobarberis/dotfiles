if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export FZF_DEFAULT_COMMAND='find .'

export PATH="$PATH:/usr/sbin:/sbin:/bin:/usr/bin:/etc:/usr/ucb:/usr/local/bin:/usr/local/local_dfs/bin:/usr/bin/X11:/usr/local/sas:$HOME/.scripts/:$HOME/.local/bin:/usr/local/bin/:/opt/nvim-linux-x86_64/bin"

export MANPATH="/usr/share/man:/usr/local/man:/usr/local/local_dfs/man"

export PAGER=less

export EDITOR=/opt/nvim-linux-x86_64/bin/nvim

## The maximum number of lines in your history file
export HISTFILESIZE=1000

## Automatically correct mistyped 'cd' directories
shopt -s cdspell

## Append to history file; do not overwrite
shopt -s histappend

## Prevent accidental overwrites when using IO redirection
set -o noclobber

<<<<<<< HEAD
# Aliases
alias vg='valgrind --track-fds=yes --leak-check=full --show-leak-kinds=all --track-origins=yes --log-file=valgrind-output.txt'
alias l='ls -Alhp --group-directories-first --color'
alias off='sudo shutdown now'
alias res-desktop='xrandr -s 1920x1200_60.00'
alias res-laptop='xrandr -s 1680x1050_60.00'
alias upd='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoclean'
alias ccd='cc -Wall -Wextra -g3 -fsanitize=address,undefined'
alias serv='python3 -m http.server'
alias e='nvim'

alias fed='nvim $(fzf)'
alias fcd='cd $(ls -d */ | fzf)'
alias fopen='open $(find . | fzf)'

## Git
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

## Navigation
alias b='cd ../'

=======
>>>>>>> 6d833675d8dc5a9a6d18a4b0e60cc28263407389
# Personal PS1
PS1='\[\e[0m\]\W \[\e[0m\]$ \[\e[0m\]'
