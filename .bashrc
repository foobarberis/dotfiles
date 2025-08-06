# Terminal
export TERM='tmux-256color'

# Directories to be added to PATH
export PATH="${HOME}/.local/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"

# Locale settings
# Might require you to run `sudo locale-gen en_US.UTF-8`
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Default command for fzf
export FZF_DEFAULT_COMMAND='find . -type f -not -path "./.git/*"'

# Editor and pager
export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="less"

# History settings
export HISTSIZE=""
export HISTFILESIZE=""
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL=ignoredups:ignorespace

# Source the script in charge of getting the branch name
. ${HOME}/.local/bin/git-prompt.sh

# Define prompt text. Shows user, host, current directory, Git branch (if
# any), and last command's exit status.
export PS1='\n[ \u@\h \W$(__git_ps1 " (%s)") ($?) ]\n> '

# Automatically correct mistyped 'cd' directories
shopt -s cdspell

# Attempts spelling correction on directory names during word completion
shopt -s dirspell

# Append to history file; do not overwrite
shopt -s histappend

# Prevent accidental overwrites when using IO redirection
set -o noclobber

### ALIASES ###

WIN_DOCS="/mnt/c/Users/16018659/OneDrive\ -\ bioMerieux/Documents"
alias docs="cd ${WIN_DOCS}"

alias journal="${EDITOR} ~/journal/journal.txt"
alias journal-work="${EDITOR} ~/journal/journal_work.txt"
alias journal-sync="git add . && git commit -m '.' && git push"

alias l='ls -Alhp --color'

alias vi='nvim'
alias vim='nvim'

alias aptupd='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get clean'
alias brewupd='brew update && brew upgrade && brew cleanup'
alias pkgupd='pkg update -y && pkg upgrade -y && pkg autoclean -y'

alias fvi='nvim "$(fzf)"'
alias fcd='cd "$(fzf)"'
alias fls='ls "$(fzf)"'
alias fmpv='mpv --fs "$(fzf)"'
