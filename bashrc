#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

####################
# Personal Changes #
####################

# PS1 Customization
TL="╭─"
BL="╰─"
BLUE="$(tput setaf 20)"
WBOLD="$(tput setaf 7 bold)"
BACKGROUND="$(tput setab 111)"
RESET="$(tput sgr0)"
PS1='${TL}[\[${BACKGROUND}${BLUE}\]\u\[${RESET}\]@\h]\n${BL}\[${WBOLD}\]( \W )\[${RESET}\] \$ '

# Source usr and .local bash completions
if [[ -f /usr/share/bash-completion/bash_completion ]]; then
	. /usr/share/bash-completion/bash_completion
fi

source "${HOME}"/.local/share/bash_completions.d/config-vpn.bash

# Source bash aliases
if [[ -f ~/.bash_aliases ]]; then
	. "${HOME}"/.bash_aliases
fi

# Add Local binaries to path
export PATH="${HOME}/.local/bin:${PATH}"

# Set man to open in neovim
export MANPAGER='nvim +Man!'

# Bash History Settings
HISTSIZE=100
HISTFILESIZE=100
HISTTIMEFORMAT="%F %T "
HISTCONTROL=ignoredups

# Personal Functions

mpv-stream() {
	yt-dlp -o - "$1" | mpv -
}

# Papirus functions
folder-update() {
	wget -qO- https://git.io/papirus-folders-install | env PREFIX="${HOME}"/.local sh
}

icon-update() {
	wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="${HOME}"/.local/share/icons sh
}

# Cargo
. "$HOME/.cargo/env"

# Node
export npm_config_prefix="$HOME/.npm-global"
export PATH="$HOME/.npm-global/bin:$PATH"

########################
# Work-Related Changes #
########################

share_connect() {
	creds_file="/home/${USER}/.creds/wfs"
	sudo mount //cfs.yale.edu/home/Translational_Brain_Imaging_Program-CC1092-MPSY_Imaging \
		/mnt/work_file_share/ \
		-t cifs -o credentials="${creds_file}",uid="$(id -u)",gid="$(id -g)",forceuid,forcegid
}

share_disconnect() {
	sudo umount /mnt/work_file_share
}

image2mp4() {
	ffmpeg -framerate 15 -pattern_type glob -i "*.${1}" -vf "scale=1920:1080:force_original_aspect_ratio=decrease" -c:v libx264 -r 15 -pix_fmt yuv420p slideshow.mp4
}

###############
# Conda Setup #
###############

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ryantcool/miniconda3/bin/conda' 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/ryantcool/miniconda3/etc/profile.d/conda.sh" ]; then
		. "/home/ryantcool/miniconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/ryantcool/miniconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<
