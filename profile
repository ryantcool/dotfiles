# shellcheck disable=SC1090,SC1091

# Load Cargo environment
if [ -f "${HOME}/.cargo/env" ]; then
    . "${HOME}/.cargo/env"
fi

# Add .local/bin if it exists
if [ -d "${HOME}/.local/bin" ] ; then
    PATH="${HOME}/.local/bin:${PATH}"
fi

# Node.js Global Binaries
export npm_config_prefix="${HOME}/.npm-global"
if [ -d "${HOME}/.npm-global/bin" ]; then
    PATH="${HOME}/.npm-global/bin:${PATH}"
fi

# PNPM Global Binaries
if [ -d "${HOME}/.pnpm-global/bin" ]; then
    PATH="${HOME}/.pnpm-global/bin:${PATH}"
fi

# Export the final built path
export PATH
