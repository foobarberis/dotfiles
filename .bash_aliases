alias upd='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt-get clean'
alias brewupd='brew update && brew upgrade && brew cleanup'
alias pkgupd='pkg update -y && pkg upgrade -y && pkg autoclean -y'

alias l='ls -Alhp --color'

# Editors
alias vi="vim"

# Files
alias todo="${EDITOR} ${FOLDER_DOCUMENTS}/todo.txt"
alias notes="${EDITOR} ${FOLDER_DOCUMENTS}/notes.txt"

# FzF
alias fvi='vi "$(fzf)"'
alias fcd='cd "$(fzf)"'
alias fls='ls "$(fzf)"'
alias fmpv='mpv --fs "$(fzf)"'

# Git
alias gad='git add'
alias gash='git stash'
alias gbl='git blame'
alias gbr='git branch'
alias gch='git checkout'
alias gco='git commit'
alias gdi='git diff'
alias glo='git log'
alias gme='git merge'
alias gpl='git pull'
alias gps='git push'
alias gre='git rebase'
alias gsh='git show'
alias gst='git status'
alias gsw='git switch'

# Navigation
alias dot="cd ${FOLDER_CODE}/dotfiles"
alias home="cd ${FOLDER_HOME}"
alias code="cd ${FOLDER_CODE}"
alias files="cd ${FOLDER_FILES}"
alias docs="cd ${FOLDER_DOCUMENTS}"
alias audio="cd ${FOLDER_AUDIO}"
alias video="cd ${FOLDER_VIDEO}"
alias games="cd ${FOLDER_GAMES}"
alias pictures="cd ${FOLDER_PICTURES}"

# 3PC
alias 3pc="cd ${FOLDER_3PC}"
alias 3pc-back="cd ${FOLDER_3PC}/3pc-web-back"
alias 3pc-front="cd ${FOLDER_3PC}/3pc-web-front"
alias 3pc-devops="cd ${FOLDER_3PC}/3pc-devops"
alias 3pc-etl="cd ${FOLDER_3PC}/mirrhia-etl"
alias 3pc-hub="cd ${FOLDER_3PC}/mirrhia-hub"
alias 3pc-report="cd ${FOLDER_3PC}/mirrhia-report"
alias 3pc-connectivity="cd ${FOLDER_3PC}/microbio-connectivity"
alias 3pc-installer="cd ${FOLDER_3PC}/3pc-installer"
