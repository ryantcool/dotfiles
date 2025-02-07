#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
TL="╭─"
BL="╰─"
BLUE="$(tput setaf 20)"
WBOLD="$(tput setaf 7 bold)"
BACKGROUND="$(tput setab 111)"
RESET="$(tput sgr0)"
PS1='${TL}[\[${BACKGROUND}${BLUE}\]\u\[${RESET}\]@\h]\n${BL}\[${WBOLD}\]( \W )\[${RESET}\] \$ '

# Personal Changes
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
	. /usr/share/bash-completion/bash_completion
fi

source "${HOME}"/.local/share/bash_completions.d/config-vpn.bash

# Add Local binaries to path
export PATH"=~/.local/bin:$PATH"

# Source bash aliases
if [[ -f ~/.bash_aliases ]]; then
    . "${HOME}"/.bash_aliases
fi


HISTSIZE=100
HISTFILESIZE=100
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups

# Personal Functions

mpv-stream() {
    yt-dlp -f bv+ba/b -o - "$1" | mpv -
}

# Cargo
. "$HOME/.cargo/env"

# Node
export PATH="$HOME/.npm-global/bin:$PATH"

##############
#Work Related#
##############

# FSL Setup
FSLDIR=~/fsl
PATH=${FSLDIR}/share/fsl/bin:${PATH}
export FSLDIR PATH
. ${FSLDIR}/etc/fslconf/fsl.sh
