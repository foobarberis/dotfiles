alias upd='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt-get clean'

alias vi='nvi'
alias ed='nvi'

# fzf
alias fe='vi $(fzf)'
alias fc='cd $(fzf)'

# Git
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
