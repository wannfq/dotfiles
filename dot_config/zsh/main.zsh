#
# Custom files
#
# This is the entryponit of the zsh config file.
# Be sure to source this file from `.zshrc`.
#
# This file should only contain base variables, function, aliases, prompt

# Init p10k instant prompt and configuration
source ${ZSH_CONFIG}/custom/p10k-init.zsh

# Init zim
source ${ZSH_CONFIG}/custom/zim-init.zsh

# Load sources
source ${ZSH_CONFIG}/custom/sources.zsh

# Loads PATH file
source ${ZSH_CONFIG}/custom/path.zsh

# Loads variables
source ${ZSH_CONFIG}/custom/variables.zsh

# Loads aliases
source ${ZSH_CONFIG}/custom/aliases.zsh

# Loads fzf config
source ${ZSH_CONFIG}/custom/fzf.zsh

# Loads functions
source ${ZSH_CONFIG}/custom/functions.zsh

# Loads secret variables
if [ -f ${ZSH_CONFIG}/.env.local ]; then
    set -o allexport
    source ${ZSH_CONFIG}/.env.local
    set +o allexport
fi
