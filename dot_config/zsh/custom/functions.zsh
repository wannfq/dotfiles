#
# Functions
#

# Source zshrc. In most cases, use `re` instead
function so() {
    source "$ZSH_CONFIG/.zshrc"
}

# Reload zsh. Quicker than sourcing zshrc
function re() {
    exec zsh
}

# Using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null \
      | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}

# Git convert local commit to stash and pull, then
# pop and re-commit the stash with same commit message.
# If multiple commits are reverted, it will combine them into one
function greo() {
    local commit_count="${1:-1}"
    local old_commit_message=$(git log -1 --pretty=%B)
    git reset --soft HEAD~$commit_count \
        && git stash && git pull && git stash pop

    printf "%s" "New commit message (leave empty to reuse old commit message): "
    read commit_message
    local commit_message=${commit_message:-$old_commit_message}
    git commit -am $commit_message
}

# Loads any js package manager to pls
function pls() {
    if [[ -f bun.lock ]]; then
        command bun "$@"
    elif [[ -f pnpm-lock.yaml ]]; then
        command pnpm "$@"
    elif [[ -f yarn.lock ]]; then
        command yarn "$@"
    elif [[ -f package-lock.json ]]; then
        command npm "$@"
    elif [[ -f deno.lock ]]; then
        command deno "$@"
    fi
}

# tldr (tlrc)
function tl() {
  if [ $# -gt 0 ]; then
    tldr "$@"
  else
    tldr --list-all | fzf --preview "tldr {} --color always" | xargs -r -I {} tldr {}
  fi
}

# Tmux sessions list
function ss() {
   $ZSH_CONFIG/executables/session-list.sh "$@"
}

# Go to tmux session, create if doesnt exists
function ssgo() {
    default_tmux_session='default'
    tmux_session=${1:-$default_tmux_session}
    tmux_window=${2}
    tmux_directory=${3}
    if [ ! -n "$TMUX" ]; then
        echo "Not in tmux session $tmux_session"
        if ! tmux has-session -t $tmux_session; then
            echo "Tmux session $tmux_session not found. Creating new $tmux_session session"
            tmux new-session -d -s $tmux_session -n '~'
        fi
        tmux attach-session -t $tmux_session
    else
        if ! tmux has-session -t $tmux_session; then
            echo "Tmux session $tmux_session not found. Creating new $tmux_session session"
            tmux new-session -d -s $tmux_session -n '~' -c '~'
        fi
        if ! tmux list-windows -t $tmux_session | grep -q $tmux_window; then
            tmux switch-client -t $tmux_session \; \
                new-window -n $tmux_window -c $work_path \; \
                select-window -t $tmux_window
        else
            tmux switch-client -t "$tmux_session:$tmux_window"
        fi
    fi
}

# Open project in tmux session
function sspro() {
    tmux_session=${1}
    # The base path of your projects
    default_base_path=$HOME/
    base_path=${2:-$default_base_path}
    if [ -n "$TMUX" ]; then
        project_path=$(ls $base_path | awk '{print $1}' | fzf --tmux \
            --border-label ' Project directory ' \
            --preview "tree -a -I '.git|.vscode' -L 1 $base_path{}")

        zle reset-prompt > /dev/null 2>&1 || true
        [[ -z "$project_path" ]] && return

        work_path=$base_path$project_path
        echo "Working on: $work_path"

        ssgo $tmux_session $project_path $work_path
    else
        ssgo $tmux_session
    fi
}

# Work on directory in tmux session. Require fzf installed
function work() {
    tmux_session='work'
    base_path=~/projects/
    sspro $tmux_session $base_path
}

# Configure on directory in tmux session. Require fzf installed
function dotc() {
    tmux_session='dotc'
    base_path=~/.local/share/chezmoi/dot_config/
    sspro $tmux_session $base_path
}
