#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Personal Changes
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
	. /usr/share/bash-completion/bash_completion
fi

source ~/.local/share/bash_completions.d/config-vpn.bash

# Add Local binaries to path
export PATH"=~/.local/bin:$PATH"

# Source bash aliases
if [[ -f ~/.bash_aliases ]]; then
    . ~/.bash_aliases
fi


HISTSIZE=100
HISTFILESIZE=100
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups

# Personal Functions

mpv-stream() {
    yt-dlp -o - $1 | mpv -
}

# Cargo
. "$HOME/.cargo/env"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
