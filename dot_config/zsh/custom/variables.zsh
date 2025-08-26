#
# Variabes
#

export TMPDIR="/tmp/"
export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=$(which nvim)

# Git extra diagnostics on error
export GITSTATUS_LOG_LEVEL=DEBUG

# Installs the default corepack shims after installing any node version
# that ships with corepack
export MISE_NODE_COREPACK='true'

# Enable color to man pages
GROFF_NO_SGR=1

# Set eza config dir
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"

# Autosuggest optimization
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
export ZSH_AUTOSUGGEST_USE_ASYNC=1
