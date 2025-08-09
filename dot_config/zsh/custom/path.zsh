#
# PATH
#

# Add homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Export gopath
export PATH="$(go env GOPATH)/bin:$PATH"

# Add krew to PATH
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
