#
# PATH
#

# homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# gopath
export GOPATH=$HOME/go 
export PATH="$(which go):$GOPATH/bin:$PATH"

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# cursor cli
export PATH="$HOME/.local/bin:$PATH"

# opencode
export PATH="$HOME/.opencode/bin:$PATH"
