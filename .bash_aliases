alias upd='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt-get clean'
alias brewupd='brew update && brew upgrade && brew cleanup'

alias vi='nvi'
alias ed='nvi'

# fzf
alias fvi='vi "$(fzf)"'
alias fcd='cd "$(fzf)"'
alias fls='ls "$(fzf)"'
alias fmpv='mpv "$(fzf)"'

# Git
alias glog='git log'
alias gadd='git add'
alias gdiff='git diff'
alias gstat='git status'
alias gcomm='git commit'
alias gpush='git push'
alias gpull='git pull'

# Navigation
alias b='cd ../'
alias l='ls -Alhp --group-directories-first --color'
alias 3pc='cd ~/Code/3PC/'
alias dot='cd ~/Code/dotfiles'

alias ssh='ssh -o TCPKeepAlive="yes" -o ServerAliveInterval="60"'
