path_prepend() {
	[[ -d "$1" ]] || return
	[[ ":$PATH:" == *":$1:"* ]] && return
	PATH="$1:$PATH"
}

path_append() {
	[[ -d "$1" ]] || return
	[[ ":$PATH:" == *":$1:"* ]] && return
	PATH="$PATH:$1"
}

path_prepend "${HOME}/.local/bin"
path_prepend "/usr/local/bin"

export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ "$(uname -s)" = "Darwin" ] && [ -x /opt/homebrew/bin/brew ]; then
   eval "$(/opt/homebrew/bin/brew shellenv bash)"
fi
if [ "$(uname -s)" = "Linux" ] && [ -x /home/linuxbrew/.linuxbrew/bin/brew ]; then
   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
fi

if [ -f "${HOME}/.local/bin/git-prompt" ]; then
	. "${HOME}/.local/bin/git-prompt"
fi

export PS1='\n[ \u@\h \W$(__git_ps1 " (%s)") ($?) ]\n> '

if [ -n "${TMUX:-}" ]; then
	export TERM='tmux-256color'
fi

export LANG="en_US.UTF-8"
export EDITOR="vim"
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

if command -v gls >/dev/null 2>&1; then
    alias l='gls -Alhp --color=auto'
elif ls --version >/dev/null 2>&1; then
    alias l='ls -Alhp --color=auto'
else
    alias l='ls -Alhp -G'
fi

alias vi="$EDITOR"
alias lz='lazygit'
alias ga='git add'
alias gc='git commit -m'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'

function sysupd {
    if command -v apt-get >/dev/null; then sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get autoremove -y && sudo apt-get clean; fi
    if command -v brew >/dev/null; then brew update && brew upgrade && brew cleanup; fi
    if command -v pkg >/dev/null; then pkg update -y && pkg upgrade -y && pkg autoclean -y; fi
}
