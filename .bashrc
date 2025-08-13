if [ -f "${HOME}/.local/bin/git-prompt" ]; then
    . "${HOME}/.local/bin/git-prompt"
fi
export PS1='\n[ \u@\h \W$(__git_ps1 " (%s)") ($?) ]\n> '
export TERM='tmux-256color'
export PATH="${HOME}/.local/bin:${HOME}/go/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="less"
export HISTSIZE=""
export HISTFILESIZE=""
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

alias t='tree'
alias l='ls -Alhp --color'

alias vi='nvim'
alias vim='nvim'

alias j="${EDITOR} ~/.journal/journal.txt"
alias jk="${EDITOR} ~/.journal/journal_work.txt"
alias js="git add ~/.journal/*.txt && git commit -m 'chore(journal): Update journal' && git push"

alias cheat='cat ~/.cheatsheet | less'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias sudo='sudo '

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
