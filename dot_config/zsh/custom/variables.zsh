#
# Variabes
#
export TMPDIR="/tmp/"
export LANG=en_US.UTF-8
export MANPATH="/usr/local/man:$MANPATH"
export EDITOR=$(which nvim)

# Git extra diagnostics on error
export GITSTATUS_LOG_LEVEL=DEBUG

# Github username

# Autosuggest optimization
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
export ZSH_AUTOSUGGEST_USE_ASYNC=1

# Lazy load zsh-nvm. Must set this variable before loading  oh-my-zsh
export NVM_LAZY_LOAD=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

# Override cd command to z. Must set this before loading oh-my-zsh
export ZOXIDE_CMD_OVERRIDE=cd
