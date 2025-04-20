alias upd='sudo apt-get update && sudo apt-get upgrade -y && sudo apt autoremove -y && sudo apt-get clean'
alias brewupd='brew update && brew upgrade && brew cleanup'

alias vi="$EDITOR"
alias ed="$EDITOR"
alias ex="$EDITOR"

# fzf
alias fvi='vi "$(fzf)"'
alias fcd='cd "$(fzf)"'
alias fls='ls "$(fzf)"'
alias fmpv='mpv --fs "$(fzf)"'

# Git
alias glog='git log'
alias gadd='git add'
alias gdiff='git diff'
alias gstat='git status'
alias gcomm='git commit'
alias gpush='git push'
alias gpull='git pull'
alias gbran='git branch'
alias gblam='git blame'
alias gchec='git checkout'

# Navigation
alias b='cd ../'
alias l='ls -Alhp --color'
alias dot='cd ${FOLDER_CODE}/dotfiles'
alias home="cd $FOLDER_HOME"
alias code="cd $FOLDER_CODE"
alias files="cd $FOLDER_FILES"
alias audio="cd $FOLDER_AUDIO"
alias video="cd $FOLDER_VIDEO"
alias games="cd $FOLDER_GAMES"
alias pictures="cd $FOLDER_PICTURES"

# 3PC
alias 3pc="cd ${FOLDER_3PC}"
alias 3pc-back="cd ${FOLDER_3PC}/3pc-web-back"
alias 3pc-front="cd ${FOLDER_3PC}/3pc-web-front"
alias 3pc-etl="cd ${FOLDER_3PC}/mirrhia-etl"
alias 3pc-hub="cd ${FOLDER_3PC}/mirrhia-hub"
alias 3pc-report="cd ${FOLDER_3PC}/mirrhia-report"
alias 3pc-misc="cd ${FOLDER_3PC}/misc"
