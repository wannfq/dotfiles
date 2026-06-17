# zsh files

Modular Zsh configuration using [zimfw](https://zimfw.sh/) with deferred loading for fast startup.

## Structure

```
~/.config/zsh/
  .zshrc                    → sets ZSH_CONFIG, sources main.zsh
  main.zsh                  → orchestrates modules in load order:
    custom/
      p10k-init.zsh         → powerlevel10k instant prompt
      zim-init.zsh          → auto-installs zimfw if missing
      sources.zsh           → zsh-defer: zoxide, mise, brew, completions
      path.zsh              → PATH additions
      variables.zsh         → EDITOR, env vars (mise, autosuggest, etc.)
      aliases.zsh           → command aliases (eza→ls, k→kubectl, tf→tofu)
      fzf.zsh               → fzf config and styling
      functions.zsh         → shell functions (pls, ss, work, dotc, greo)
      configs.zsh           → history, completion, autocd, autocorrect
  .zimrc                    → zimfw module declarations (private_dot_zimrc)
  executables/               → executable scripts
  .env.local                → secrets, sourced with allexport (never committed)
```

## Load Order

`~/.zshenv` → `.zshrc` → `main.zsh` → modular files in this order:
p10k-init → zim-init → sources → path → variables → aliases → fzf → functions → configs → .env.local

## Key Pattern: Deferred Loading

External tools are loaded lazily via `zsh-defer _evalcache` to keep shell startup fast:

```zsh
zsh-defer _evalcache zoxide init zsh --cmd cd
zsh-defer _evalcache mise activate zsh
zsh-defer _evalcache "$(/opt/homebrew/bin/brew shellenv)"
zsh-defer _evalcache opencode completion zsh
```

## Key Features

### Aliases

| Alias | Command | Notes |
|---|---|---|
| `ls`, `la`, `ll`, `lt` | `eza` | Icon-fied, git-aware replacements |
| `vim` | `nvim` | |
| `cat` | `bat` | |
| `y` | `yazi` | |
| `k` | `kubectl` | |
| `kctx` | `kubectl ctx` | |
| `kns` | `kubectl ns` | |
| `mk` | `minikube` | |
| `tf` | `tofu` | OpenTofu |
| `lg` | `lazygit` | |
| `ld` | `lazydocker` | |
| `oc` | `opencode --port` | |
| `prof` | shell startup profiler | |

### Functions

| Function | Description |
|---|---|
| `re` | Reload zsh (`exec zsh`) |
| `so` | Source `.zshrc` |
| `pls` | Auto-detect JS package manager (bun/pnpm/yarn/deno/npm) and run command |
| `ss` | Tmux session list (fzf-based) |
| `ss-go` | Go to tmux session, create if absent |
| `ss-project` | Open project in tmux session |
| `work` | Fzf-select directory and open in tmux |
| `dotc` | Fzf-select directory and open in tmux for config editing |
| `greo` | Git rebase onto origin/main with stash preservation |
| `fif` | Find-in-file using ripgrep + fzf preview |
| `tl` | tldr with fallback to man |
| `awsauth` | AWS authentication |
| `owner` | SEEK owners lookup |
| `awsaccount` | AWS account lookup |

## Dependencies

### Required

- git
- zimfw (auto-installed on first shell startup if missing)

### Recommended (used by configs, auto-installed by bootstrap)

| Tool | Used by |
|---|---|
| zsh-defer + evalcache | Fast startup (sources.zsh) |
| powerlevel10k | Prompt (p10k-init.zsh) |
| fzf + fzf-tab | Fuzzy completion, session picker |
| eza | `ls`/`la`/`ll`/`lt` aliases |
| bat | `cat` alias, fzf-tab previews |
| ripgrep | `fif` function |
| zoxide | `cd` replacement (sources.zsh) |
| mise | Runtime management (sources.zsh) |
| tmux | `ss`/`ss-go`/`work`/`dotc` functions |
| opencode | `oc` alias, completions (sources.zsh) |
| kubectl | `k`/`kctx`/`kns` aliases |

### Optional (referenced but not auto-installed)

- minikube, opentofu, go, bun/pnpm/yarn/deno, orbstack, sesh, awscli

## Setup

The chezmoi bootstrap handles everything. For manual setup:

1. Add XDG dirs to `~/.zshenv`:
```sh
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export ZDOTDIR=$XDG_CONFIG_HOME/zsh
```

2. Zim modules auto-install on first shell startup. If you need to manually install zimfw:
```sh
wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
```

3. Create `~/.config/zsh/.env.local` for secrets (sourced with `set -o allexport`):
```sh
# Example
export GITHUB_TOKEN="ghp_..."
export OPENAI_API_KEY="sk-..."
```

## Tips

- Run `prof` to profile shell startup time
- `re` (exec zsh) is faster than `so` (source .zshrc) for reloading config
- History lives at `~/.config/zsh/.zhistory` (10k lines, deduplicated)
