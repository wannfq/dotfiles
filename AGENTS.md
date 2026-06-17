# Repository Guidelines

## Project Overview

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/). Source directory is `~/.local/share/chezmoi` (this repo); targets are files in `~`. The bootstrap script (`run_once_before_install.sh.tmpl`) provisions a full development environment on **macOS** (Apple Silicon/Intel) and **Arch Linux** — installing package managers, CLI tools, fonts, plugin managers, and runtime version managers in one `chezmoi apply`.

This repo has **no build system, no test harness, no linter, and no CI**. Validation is done with chezmoi directly (`chezmoi diff`, `chezmoi apply`).

## Architecture & Data Flow

### Chezmoi Source → Target Pipeline

```
Source file                          Target file (after chezmoi apply)
─────────────────────────────────────────────────────────────────────
dot_foo                    →         ~/.foo
private_dot_foo            →         ~/.foo          (0600 perms)
foo.tmpl                   →         ~/.foo          (Go template rendered)
run_once_before_*.sh.tmpl  →         (executed once, no target file)
executable_foo             →         ~/.../foo       (chmod +x applied)
```

Templates use chezmoi Go template syntax. The primary template variables are:
- `.chezmoi.os` — `"darwin"` or `"linux"`
- `.chezmoi.osRelease.id` — `"arch"` (when on Arch Linux)

### Zsh Config Load Order

```
~/.zshenv                          ← XDG_* vars, ZDOTDIR
  └─ ~/.config/zsh/.zshrc          ← sourced by zsh, sets ZSH_CONFIG
       └─ main.zsh                 ← orchestrates modular files in order:
            ├─ p10k-init.zsh       ← powerlevel10k instant prompt
            ├─ zim-init.zsh        ← auto-installs zimfw if missing
            ├─ sources.zsh         ← zsh-defer: zoxide, mise, brew, completions
            ├─ path.zsh            ← PATH additions
            ├─ variables.zsh       ← EDITOR, env vars
            ├─ aliases.zsh         ← command aliases
            ├─ fzf.zsh             ← fzf config
            ├─ functions.zsh       ← shell functions
            ├─ configs.zsh         ← history, completion, autocd, autocorrect
            └─ .env.local          ← secrets (sourced with allexport if present)
```

Key pattern: **lazy loading via `zsh-defer _evalcache`** — external tools (zoxide, mise, brew, completions) are deferred so shell startup stays fast.

### Neovim Config Structure

```
~/.config/nvim/init.lua            ← require("custom")
  └─ lua/custom/init.lua           ← require("custom.core") + require("custom.lazy_init")
       ├─ lua/custom/core/         ← base settings (options, globals, keymaps)
       └─ lua/custom/lazy/         ← one .lua file per plugin, each returns lazy.nvim spec
```

Plugin convention: **every plugin gets its own file under `lazy/custom/lazy/<name>.lua`** returning a lazy.nvim spec table. `lazy_init.lua` bootstraps lazy.nvim (auto-clones from GitHub if absent) and points `spec` at `custom.lazy`.

### Tmux Session Delegation

Both zsh and tmux use the **same session picker script**. The tmux config runs a thin shell wrapper (`executables/session-list-caller.sh`) that delegates to zsh's `executables/session-list.sh`. This is intentional code sharing across config domains.

## Key Directories

| Directory | Purpose |
|---|---|
| `dot_config/zsh/` | Zsh config: zimfw modules, custom scripts, aliases, functions |
| `dot_config/nvim/` | Neovim IDE: lazy.nvim with LSP, blink-cmp, treesitter, copilot, dap |
| `dot_config/tmux/` | Tmux config with TPM and catppuccin theme |
| `dot_config/kitty/` | Kitty terminal emulator with OS-specific keybinds via `.tmpl` |
| `dot_config/ghostty/` | Ghostty terminal (flat config, no template) |
| `dot_config/yazi/` | Yazi file manager with 9 plugins + 3 flavors |
| `dot_config/fastfetch/` | System info display with custom Nerd Font layout |
| `dot_config/opencode/` | OpenCode AI agent: MCP servers, permissions, agent presets, TUI keybinds |
| `dot_config/private_k9s/` | k9s Kubernetes TUI: config, aliases, skins, 40+ plugin YAMLs |
| `dot_omp/` | OMP harness agent config (model roles, providers, features) |
| `.` (root) | `dot_zshenv`, `run_once_before_install.sh.tmpl`, README |

## Development Commands

This repo has **no build, test, or lint steps**. The only validation commands are chezmoi's built-in operations:

```sh
# Preview changes before applying
chezmoi diff

# Apply changes to live dotfiles
chezmoi apply

# Edit a target file (re-adds to source automatically)
chezmoi edit ~/.config/foo

# Verify template syntax
chezmoi execute-template < file.tmpl
```

**NEVER** run `chezmoi apply --force` or pass `--force` to chezmoi. If chezmoi prompts about overwriting local changes, stop and investigate — do not bypass the prompt. `--force` silently overwrites local target files and will cause data loss.

### Git Workflow (per memory/README)

```sh
# Before editing: stash local changes
git stash
# Pull latest
git pull --rebase
# Push after committing
git push
# Restore local changes
git stash pop
```

## Code Conventions & Common Patterns

### Chezmoi Naming Conventions

| Prefix/Suffix | Meaning | Example |
|---|---|---|
| `dot_` | File becomes a dotfile in `~` | `dot_zshenv` → `~/.zshenv` |
| `private_` | File gets `0600` permissions | `private_dot_gitconfig` → `~/.gitconfig` |
| `.tmpl` | Go template rendered before writing | `kitty.conf.tmpl` |
| `run_once_before_` | Executed once on first apply | `run_once_before_install.sh.tmpl` |
| `executable_` | Gets `chmod +x` applied | `executable_session-list.sh` |


### Template Patterns

OS branching uses chezmoi Go template conditionals:

```
{{ if eq .chezmoi.os "darwin" -}}
# macOS-specific
{{- else if eq .chezmoi.os "linux" -}}
{{-   if eq .chezmoi.osRelease.id "arch" }}
# Arch Linux-specific
{{-   end }}
{{- end }}
```

Kitty uses template **variables** (`$mod`, `$font`, `$pad`) assigned per-OS so keybinds adapt (`cmd` on macOS, `alt` on Linux) without duplicating the config body.

### Bootstrap Install Pattern

The `install()` helper in `run_once_before_install.sh.tmpl` is the single pattern for all package installation:

```sh
# Usage: install <command> <macos_pkg> <arch_pkg> [type]
# type: "pkg" (default) or "cask" (macOS only)

install  nvim        neovim          neovim
install  kitty       kitty           kitty           cask
install  ""          font-meslo-...  ttf-meslo-nerd  cask   # no command check for fonts
```

- Idempotent: checks `command -v` before installing
- OS-branched at template render time (no runtime OS detection for package names)
- Empty command arg for packages with no CLI (fonts)

### Plugin Manager Patterns

Four independent plugin managers, each auto-bootstrapping:

| Manager | Config | Bootstrap |
|---|---|---|
| **zimfw** | `private_dot_zimrc` | `curl | zsh` in bootstrap script |
| **TPM** | `tmux.conf` `@plugin` directives | `git clone` in bootstrap, `prefix + I` to install |
| **lazy.nvim** | `lazy_init.lua` + `lazy/*.lua` | Auto-clones from GitHub on first nvim launch |
| **ya (yazi)** | `package.toml` with commit+hash pins | `ya pkg install` |

Generated/plugin state directories are **excluded** in `.chezmoiignore` — they are never committed.

### Formatting Conventions

- **Lua (neovim):** StyLua — 4-space indent, spaces, no call parentheses (`no_call_parentheses = true`)
- **Shell:** No formatter; `set -e` in bootstrap script, `[[` for conditionals in zsh functions
- **YAML:** 2-space indent (k9s configs, omp config)
- **JSON/JSONC:** 2-space indent (opencode, fastfetch, oh-my-opencode-slim)

### Theme Conventions

Dark themes throughout: Catppuccin Mocha is the unifying theme across tmux, ghostty, and yazi. Kitty uses bl1nk. All UIs use Nerd Fonts for icons.

### State Management

- **XDG base directories** are set in `dot_zshenv`: `XDG_CONFIG_HOME`, `XDG_CACHE_HOME`, `XDG_DATA_HOME`, `XDG_STATE_HOME`
- `ZDOTDIR` points to `$XDG_CONFIG_HOME/zsh` — all zsh state lives in `~/.config/zsh/`
- **Secrets:** Loaded from `~/.config/zsh/.env.local` (sourced with `set -o allexport`), never committed
- **API tokens:** Referenced via chezmoi template `{env:VAR}` syntax in OpenCode config

## Important Files

### Entry Points

| File | Role |
|---|---|
| `dot_zshenv` | Sets XDG dirs + ZDOTDIR; sourced first by zsh |
| `dot_config/zsh/private_dot_zshrc` | `~/.zshrc` — exports `ZSH_CONFIG`, sources `main.zsh` |
| `dot_config/zsh/main.zsh` | Orchestrates all zsh config modules in order |
| `dot_config/nvim/init.lua` | 18-byte entry: `require("custom")` |
| `run_once_before_install.sh.tmpl` | One-time bootstrap: OS detection, package install, plugin managers |

### Config Files

| File | Purpose |
|---|---|
| `dot_config/opencode/opencode.jsonc` | OpenCode MCP servers, permissions, plugins, agent colors |
| `dot_config/opencode/oh-my-opencode-slim.json` | Model presets (cheap/openai/opencode-go) mapping agent roles to models |
| `dot_config/opencode/tui.json` | TUI keybinds: leader `ctrl+space` |
| `dot_omp/private_agent/config.yml` | OMP harness: model roles, providers, concurrency, retry policy |
| `dot_config/kitty/kitty.conf.tmpl` | Kitty terminal with OS-conditional keybinds |
| `dot_config/tmux/tmux.conf` | Tmux: C-Space prefix, vim-nav, catppuccin theme |
| `dot_config/yazi/package.toml` | Yazi plugin/flavor pins with commit hashes |
| `dot_config/private_k9s/private_config.yaml` | k9s settings: refresh rate, shell pod, thresholds |

### Key Modules

| File(s) | Content |
|---|---|
| `dot_config/zsh/custom/aliases.zsh` | Alias definitions (eza→ls, vim→nvim, k→kubectl, tf→tofu) |
| `dot_config/zsh/custom/functions.zsh` | Shell functions: `pls` (JS pkg manager), `ss`/`ss-go` (tmux sessions), `work`/`dotc` (project launchers) |
| `dot_config/zsh/custom/sources.zsh` | Deferred sources: zoxide, mise, brew, completions |
| `dot_config/zsh/custom/path.zsh` | PATH: homebrew, GOPATH, krew, opencode, omp |
| `dot_config/zsh/private_dot_zimrc` | 19 zimfw modules (syntax highlighting, autosuggestions, p10k, fzf-tab, etc.) |
| `dot_config/nvim/lua/custom/lazy/` | 30+ lazy.nvim plugin specs, one file per plugin |
| `.chezmoiignore` | Excludes generated plugin dirs, logs, history from chezmoi |

## Runtime/Tooling Preferences

- **Shell:** zsh with zimfw plugin manager (not oh-my-zsh)
- **Editor:** Neovim with lazy.nvim (Lua config, not Vimscript)
- **Terminal:** Kitty (primary, OS-templated) — ghostty (secondary, flat config)
- **Package managers:** Homebrew (macOS), yay (Arch) — auto-installed by bootstrap
- **Runtime version manager:** mise (installed via `curl | sh`)
- **Node.js:** corepack shims installed automatically via `MISE_NODE_COREPACK=true`
- **Session management:** tmux with TPM, custom fzf session picker
- **Kubernetes:** k9s with 40+ community plugins plus custom kubectl helpers
- **AI coding:** OpenCode agent with oh-my-opencode-slim presets; OMP as harness backend

## Testing & QA

There are **no formal tests**. Quality is maintained through:

- **Idempotent bootstrap:** `install()` helper checks `command -v` before every install
- **Template syntax verification:** `chezmoi execute-template < file.tmpl`
- **Dry-run before apply:** `chezmoi diff` before `chezmoi apply`
- **Plugin auto-install:** Each plugin manager bootstraps itself on first launch
- **OS-locked templates:** Bootstrap exits early on unsupported OS; templates only handle macOS and Arch

When modifying templates, always run `chezmoi execute-template` to verify syntax. When adding new config files, check `.chezmoiignore` to ensure generated state stays excluded.
