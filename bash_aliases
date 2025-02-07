# List Aliases below as follows:
# alias alias_name='command/to/run'

alias ls='lsd'
#alias docker='podman'

# Kitty
alias kitty-update='curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
alias kssh='kitty +kitten ssh'

# Papirus Icon Install and Update
alias icon-update="wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="$HOME/.local/share/icons" sh"
alias folder-update="wget -qO- https://git.io/papirus-folders-install | env PREFIX=$HOME/.local sh"
# Bluetooth

# VPN
alias config-vpn='/home/$USER/.local/bin/config-vpn'


# Applications

# Work
alias share_connect='sudo mount //cfs.yale.edu/home/Translational_Brain_Imaging_Program-CC1092-MPSY_Imaging /mnt/work_file_share/ -t cifs -o credentials=/home/$USER/.creds/wfs,uid=$(id -u),gid=$(id -g),forceuid,forcegid'
alias share_disconnect='sudo umount /mnt/work_file_share'
