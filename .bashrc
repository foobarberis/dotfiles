if [ -f "${HOME}/.local/bin/git-prompt" ]; then
    . "${HOME}/.local/bin/git-prompt"
fi
export PS1='\n[ \u@\h \W$(__git_ps1 " (%s)") ($?) ]\n> '
if [ -n "${TMUX:-}" ]; then
    export TERM='tmux-256color'
fi
export PATH="${HOME}/.local/bin:/usr/local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="less"
export HISTSIZE="100000"
export HISTFILESIZE="200000"
export HISTTIMEFORMAT="%F %T "
export HISTCONTROL="ignoredups:ignorespace"
export FZF_DEFAULT_COMMAND='find . -type f -not -path "*/.git/*" -not -path "*/node_modules/*" -not -path "*/target/*"'
# Enable fzf's shell integration
# CTRL-t Fuzzy find all files and subdirectories of the working directory, and output the selection to STDOUT.
# ALT-c	Fuzzy find all subdirectories of the working directory, and run the command “cd” with the output as argument.
# CTRL-r Fuzzy find through your shell history, and output the selection to STDOUT.
if command -v fzf &>/dev/null; then
    eval "$(fzf --bash)"
fi

shopt -s histappend
shopt -s cdspell
shopt -s dirspell

set -o noclobber

alias para='cd "/mnt/c/Users/16018659/OneDrive - bioMerieux/Documents/PARA"'

alias t='tree'
if command -v gls >/dev/null 2>&1; then
    alias l='gls -Alhp --color=auto'
else
    alias l='ls -Alhp -G'
fi

alias v='nvim'
alias ed='nvim'
alias vi='nvim'
alias vim='nvim'

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gca='git commit -a -m'
alias gs='git status'
alias gco='git checkout'
alias gb='git branch'
alias gl='git log --oneline --graph --decorate'
alias gsw='git switch'

# Universal system update function. Detects package manager.
function sysupd {
    if command -v apt-get >/dev/null; then
        sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get clean
    elif command -v brew >/dev/null; then
        brew update && brew upgrade && brew cleanup
    elif command -v pkg >/dev/null; then
        pkg update -y && pkg upgrade -y && pkg autoclean -y
    else
        echo "No supported package manager (apt, brew, pkg) found." >&2
        return 1
    fi
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
