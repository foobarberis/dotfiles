## Set $PATH, which tells the computer where to search for commands
export PATH="$PATH:/usr/sbin:/sbin:/bin:/usr/bin:/etc:/usr/ucb:/usr/local/bin:/usr/local/local_dfs/bin:/usr/bin/X11:/usr/local/sas:$HOME/.scripts/"

## Where to search for manual pages
export MANPATH="/usr/share/man:/usr/local/man:/usr/local/local_dfs/man"

## Which pager to use.
export PAGER=less

## Choose your weapon
export EDITOR=/usr/bin/vim

## The maximum number of lines in your history file
export HISTFILESIZE=50

## Enables displaying colors in the terminal
export TERM=xterm-256color

## Disable automatic mail checking
unset MAILCHECK 

## Automatically correct mistyped 'cd' directories
shopt -s cdspell

## Append to history file; do not overwrite
shopt -s histappend

## Prevent accidental overwrites when using IO redirection
set -o noclobber

# Aliases
alias l='ls -Alhp --group-directories-first --color'
alias off='sudo shutdown now'
alias frac='cd ~/Git/42/42-fractol'
alias res='xrandr -s 1920x1080'
alias dres='xrandr -s 1920x1200'
alias lres='xrandr -s 1680x1050'
alias setup='xrdb -merge ~/.Xresources && source ~/.xprofile'
alias cc='gcc -Wall -Wextra -Werror'
alias ccl='gcc -Wall -Wextra -Iinc/ -lX11 -lXext'
alias ccd='gcc -Wall -Wextra -g -fsanitize=address'
alias on='setup && dres'
# alias vim='vim -u NONE -N'
alias tmux='TERM=screen-256color-bce tmux'

## Git
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

## Navigation
alias b='cd ../'

# Personal PS1
PS1='\[\e[0m\]\W \[\e[0m\]λ \[\e[0m\]'
