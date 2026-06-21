#
# ~/.bash_profile
#

# shellcheck disable=SC1090,SC1091

# Include ~/.profile so both Plasma and Terminal share the same paths
if [ -f "${HOME}/.profile" ]; then
    . "${HOME}/.profile"
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
