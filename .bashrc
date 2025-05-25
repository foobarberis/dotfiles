# Terminal
export TERM='tmux-256color'

export FOLDER_FILES=${HOME}/Files

# Add 'storage/shared' prefix if we are running on termux
if [ -d ${HOME}/storage ]; then
    export FOLDER_FILES=${HOME}/storage/shared/Files
fi

export FOLDER_CODE=${FOLDER_FILES}/Code
export FOLDER_3PC=${FOLDER_CODE}/3PC
export FOLDER_DOCUMENTS=${FOLDER_FILES}/Documents
export FOLDER_AUDIO=${FOLDER_FILES}/Audio
export FOLDER_VIDEO=${FOLDER_FILES}/Video
export FOLDER_GAMES=${FOLDER_FILES}/Games
export FOLDER_PICTURES=${FOLDER_FILES}/Pictures

# Directories to be added to PATH
export PATH="${HOME}/.local/bin:/usr/local/bin:/opt/homebrew/bin:$PATH"

# Locale settings
# Might require you to run `sudo locale-gen en_US.UTF-8`
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Default command for fzf
export FZF_DEFAULT_COMMAND='find . -type f -not -path "./.git/*"'

# Editor and pager
export EDITOR="vim"
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
export PS1='\n--[ \u@\h \W$(__git_ps1 " (%s)") ($?) ]--\n↪ '

# Automatically correct mistyped 'cd' directories
shopt -s cdspell

# Attempts spelling correction on directory names during word completion
shopt -s dirspell

# Append to history file; do not overwrite
shopt -s histappend

# Prevent accidental overwrites when using IO redirection
set -o noclobber

# Shell-side configuration for vterm
vterm_printf() {
    if [ -n "$TMUX" ] \
        && { [ "${TERM%%-*}" = "tmux" ] \
            || [ "${TERM%%-*}" = "screen" ]; }; then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_cmd() {
    local vterm_elisp
    vterm_elisp=""
    while [ $# -gt 0 ]; do
        vterm_elisp="$vterm_elisp""$(printf '"%s" ' "$(printf "%s" "$1" | sed -e 's|\\|\\\\|g' -e 's|"|\\"|g')")"
        shift
    done
    vterm_printf "51;E$vterm_elisp"
}

vterm_prompt_end(){
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}
PS1=$PS1'\[$(vterm_prompt_end)\]'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
