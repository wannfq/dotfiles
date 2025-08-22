#
# Sources
#

# Load zsh-defer
source ${ZIM_HOME}/modules/zsh-defer/zsh-defer.plugin.zsh

if [ -x /opt/homebrew/bin/brew ]; then
    zsh-defer _evalcache "$(/opt/homebrew/bin/brew shellenv)"
fi 

# Init zoxide
zsh-defer _evalcache zoxide init zsh --cmd cd

# Activate mise
zsh-defer _evalcache mise activate zsh

# Load orbstack
zsh-defer source ${HOME}/.orbstack/shell/init.zsh
