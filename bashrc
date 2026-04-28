#
# ~/.bashrc
#

######################
# SHELLCHECK OPTIONS #
######################

# shellcheck disable=SC1090,SC1091

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

####################
# Personal Changes #s
####################

# PS1 Customization
#TL="╭─"
TL="─" # This looks better with conda (base) in PS1
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

. "${HOME}"/.local/share/bash_completions.d/config-vpn.bash

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

######################
# Personal Functions #
######################

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

# Render CV
rendercv() {
    docker run --rm -v "${PWD}":/work -u "$(id -u)":"$(id -g)" -e HOME=/tmp -w /work ghcr.io/rendercv/rendercv "$@"
}

# Pacman Mirrors
update_mirrors() {
    _sudo=/usr/bin/sudo
    num_mirrors="$1"

    rankmirrors -n "${num_mirrors}" /etc/pacman.d/mirrorlist.backup \
        | "${_sudo}" tee /etc/pacman.d/mirrorlist > /dev/null
}

##################
# Coding Related #
##################

# Cargo
. "${HOME}/.cargo/env"

# Node
export npm_config_prefix="${HOME}/.npm-global"
export PATH="${HOME}/.npm-global/bin:${PATH}"

# PNPM
export PATH="${HOME}/.pnpm-global/bin:${PATH}"


# Conda Setup

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("${HOME}/miniconda3/bin/conda" 'shell.bash' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
    eval "${__conda_setup}"
else
    if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/miniconda3/bin:${PATH}"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

############################
# SSH Agent for VSCode/Zed #
############################

SSH_ENV="${HOME}/.ssh/ssh-agent"

# Load existing agent env if present
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" >/dev/null
fi

# Test if agent is actually usable
ssh-add -l >/dev/null 2>&1
if [ $? -eq 2 ]; then
    ssh-agent -s >"${SSH_ENV}"
    . "${SSH_ENV}" >/dev/null
    ssh-add >/dev/null 2>&1
fi

########################
# Work-Related Changes #
########################

share_connect() {
    sudo mount //cfs.yale.edu/home/Translational_Brain_Imaging_Program-CC1092-MPSY_Imaging \
        /mnt/work_file_share/ \
        -t cifs -o username=rtc29,uid="$(id -u)",gid="$(id -g)",forceuid,forcegid
}

share_disconnect() {
    sudo umount /mnt/work_file_share
}

image2mp4() {
    ffmpeg -framerate 15 -pattern_type glob -i "*.${1}" -vf "scale=1920:1080:force_original_aspect_ratio=decrease" -c:v libx264 -r 15 -pix_fmt yuv420p slideshow.mp4
}
