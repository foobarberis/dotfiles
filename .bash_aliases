alias brc='source ~/.bashrc'

alias vi='vim'
alias ed='vim'

alias off='sudo shutdown now'
alias upd='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt-get clean'

# fzf
alias fe='nvim $(fzf)'
alias fc='cd $(fzf)'

# Git
alias gs='git status'
alias gc='git commit'
alias gp='git push'
alias gpl='git pull'

# Navigation
alias b='cd ../'
alias l='ls -Alhp --group-directories-first --color'

alias ssh='ssh -o TCPKeepAlive="yes" -o ServerAliveInterval="60"'
