# List Aliases below as follows:
# alias alias_name='command/to/run'

alias ls='lsd'

# Kitty

alias kssh='kitty +kitten ssh'


# Bluetooth

alias indyevo_connect='bluetoothctl connect 38:F3:2E:DA:B8:EF'

alias indyevo_disconnect='bluetoothctl disconnect'


# VPN
alias config-vpn='/home/$USER/.local/bin/config-vpn'


# Applications

alias vba='/home/$USER/Games/src/visualboyadvance-m-2.1.4/build/visualboyadvance-m'

alias deemix='/home/$USER/.local/share/applications/deemix-gui.AppImage'

# Linode

alias linode_connect='ssh -i ~/.ssh/linode_nc ryancool@ncvault74linode.ddns.net -p 62892'

# Work

alias share_connect='sudo mount -t cifs -o "credentials=/home/$USER/.creds/wfs,dir_mode=0777,file_mode=0777" //cfs.yale.edu/home/Translational_Brain_Imaging_Program-CC1092-MPSY_Imaging /mnt/work_file_share/'

alias share_disconnect='sudo umount /mnt/work_file_share'
