alias upd='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt-get clean'
alias brewupd='brew update && brew upgrade && brew cleanup'
alias pkgupd='pkg update -y && pkg upgrade -y && pkg autoclean -y'

alias l='ls -Alhp --color'

# Editors
alias vi="$EDITOR"
alias ed="$EDITOR"
alias ex="$EDITOR"

# Files
alias todo="${EDITOR} ${FOLDER_DOCUMENTS}/todo.txt"
alias notes="${EDITOR} ${FOLDER_DOCUMENTS}/notes.txt"

# FzF
alias fvi='vi "$(fzf)"'
alias fcd='cd "$(fzf)"'
alias fls='ls "$(fzf)"'
alias fmpv='mpv --fs "$(fzf)"'

# Git
alias glo='git log'
alias gad='git add'
alias gdi='git diff'
alias gst='git status'
alias gco='git commit'
alias gps='git push'
alias gpl='git pull'
alias gbr='git branch'
alias gbl='git blame'
alias gch='git checkout'
alias gsh='git show'
alias gre='git rebase'
alias gash='git stash'

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
