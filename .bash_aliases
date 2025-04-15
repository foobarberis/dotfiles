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
alias dot='cd ~/Code/dotfiles'

# 3PC
3PC_FOLDER="$HOME/Code/3PC"
alias 3pc='cd ~/Code/3PC/'
alias 3pc-back="cd ${3PC_FOLDER}/3pc-web-back"
alias 3pc-front="cd ${3PC_FOLDER}/3pc-web-front"
alias 3pc-etl="cd ${3PC_FOLDER}/mirrhia-etl"
alias 3pc-hub="cd ${3PC_FOLDER}/mirrhia-hub"
alias 3pc-report="cd ${3PC_FOLDER}/mirrhia-report"
alias 3pc-misc="cd ${3PC_FOLDER}/misc"

alias ssh='ssh -o TCPKeepAlive="yes" -o ServerAliveInterval="60"'
