#
# This is the entryponit of the zsh config file.
# Be sure to source this file from `~/.zshrc`.
#
# This file should only contain base variables, profiler, powerlevel10k, Oh My Zsh.
#

# Startup profiler debug start. Must be at the very top of ~/.zshrc file.
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zmodload zsh/zprof
fi

# Path to zsh config directory
export ZSH_CONFIG="$HOME/.config/zsh"
# Path to your Oh My Zsh installation.
export ZSH="$ZSH_CONFIG/.oh-my-zsh"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Optimizations
#
# Disable magic functions
export DISABLE_MAGIC_FUNCTION="true"

# Auto update setting
zstyle ':omz:update' mode auto # auto | reminder | disabled
zstyle ':omz:update' frequency 14 # udpate every 14 days

# Cache completions aggressively
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
    compinit
else
    compinit -C
fi

#
# Theme
#

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
export ZSH_THEME="powerlevel10k/powerlevel10k"

#
# Custom files
#

# Load sources
source $ZSH_CONFIG/custom/sources.zsh

# Load eval
source $ZSH_CONFIG/custom/eval.zsh

# Loads PATH file
source $ZSH_CONFIG/custom/path.zsh

# Loads variables
source $ZSH_CONFIG/custom/variables.zsh

# Loads aliases
source $ZSH_CONFIG/custom/aliases.zsh

# Loads fzf config
source $ZSH_CONFIG/custom/fzf.zsh

# Loads functions
source $ZSH_CONFIG/custom/functions.zsh

# Loads secrets
set -o allexport
source $ZSH_CONFIG/.env.local
set +o allexport

#
# Plugin
#
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#
plugins=(
    git
    aliases
    zoxide
    fzf
    alias-finder
    kubectl
    command-not-found
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Startup profiler debug end. Must be at the very bottom of ~/.zshrc
if [ -n "${ZSH_DEBUGRC+1}" ]; then
    zprof
fi
