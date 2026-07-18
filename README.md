# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Supported OS

- macOS (Apple Silicon & Intel)
- Arch Linux

## Required Dependencies

Only `curl` and `git` are required to bootstrap. The install script handles everything else.

**macOS**: Xcode Command Line Tools (for git)
```sh
xcode-select --install
```

**Arch Linux**: Base packages
```sh
sudo pacman -S git curl
```

## Quickstart

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply wannfq
```

The install script will automatically:
- Install the appropriate package manager (Homebrew on macOS, yay on Arch)
- Install 30+ CLI tools, dev tools, fonts
- Configure plugin managers (zimfw, TPM, yazi plugins)

## Repository Structure

| File/Directory | Purpose |
|---|---|
| `dot_zshenv` | Sets XDG base directories and `ZDOTDIR` |
| `dot_config/` | Application configs managed by chezmoi |
| `dot_omp/` | OMP harness agent config |
| `run_once_before_install.sh.tmpl` | One-time bootstrap: OS detection, package install, plugin setup |
| `private_dot_gitconfig` | Git config (delta pager, 1Password SSH signing) |
| `AGENTS.md` | AI assistant guide: architecture, conventions, patterns |

## Installed Tools

### Core Utilities

| Tool | Description |
|---|---|
| git | Version control |
| curl | HTTP client |
| man-db | Manual pages (Arch only — macOS ships its own) |

### CLI Tools

| Tool | Description |
|---|---|
| neovim | Modern Vim-based editor |
| tmux | Terminal multiplexer |
| zsh | Z shell |
| yazi | Terminal file manager |
| fastfetch | System information tool |
| eza | Modern `ls` replacement |
| bat | Modern `cat` with syntax highlighting |
| fzf | Fuzzy finder |
| zoxide | Smarter `cd` command |
| lazygit | Git TUI |
| lazydocker | Docker TUI |
| ripgrep | Fast grep alternative |
| jq | JSON processor |
| yq | YAML processor |
| fd | Modern `find` replacement |
| fx | Terminal JSON viewer |
| curlie | Modern curl wrapper |
| git-delta | Better git diff |
| btop | Resource monitor |
| tealdeer | Fast tldr client |

### Terminal Emulators

| Tool | Description |
|---|---|
| kitty | GPU-based terminal (primary — OS-templated config) |
| ghostty | GPU-accelerated terminal (secondary — flat config) |

### Dev Tools

| Tool | Description |
|---|---|
| k9s | Kubernetes TUI |
| kubectl | Kubernetes CLI |
| krew | kubectl plugin manager |
| docker | Container runtime |
| gh | GitHub CLI |
| mise | Runtime version manager |
| opencode | AI coding agent for terminal |

### Fonts (Nerd Fonts)

- Meslo Nerd Font
- Monaspace Nerd Font
- JetBrains Mono Nerd Font

### Plugin Managers

| Tool | Description |
|---|---|
| zimfw | Zsh plugin manager |
| TPM | Tmux Plugin Manager |
| lazy.nvim | Neovim plugin manager (auto-bootstraps) |
| ya (yazi) | Yazi plugin/package manager |

## Configured Applications

### zsh

Modular shell configuration using zimfw. Load order: p10k → zim → sources → path → variables → aliases → fzf → functions → configs → .env.local.

Key plugins:
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) prompt (instant prompt enabled)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions), [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
- [fzf-tab](https://github.com/Aloxaf/fzf-tab) fuzzy tab completion
- [zsh-defer](https://github.com/romkatv/zsh-defer) + [evalcache](https://github.com/mroth/evalcache) for fast startup
- [zoxide](https://github.com/ajeetdsouza/zoxide) `cd` replacement
- [mise](https://mise.jdx.dev/) runtime activation

Custom functions: `pls` (auto-detect JS package manager), `ss`/`ss-go` (tmux session switcher), `work`/`dotc` (project launchers with fzf), `greo` (git rebase helper).

### neovim

Full IDE via lazy.nvim. One plugin spec file per plugin under `lua/custom/lazy/`. Includes: LSP (mason + nvim-lspconfig), blink-cmp, treesitter, conform (formatting), gitsigns, snacks, trouble, dap, copilot/codeium, and more. StyLua formatting: 4-space indent, no call parentheses.

Leader key: `<Space>`. Keymaps: `<Space>sk` search keymaps, `<Space>sh` search help.

### tmux

- Prefix: `C-Space` (not `C-b`)
- Vim-style pane navigation: `h/j/k/l` (select), `H/J/K/L` (resize)
- Splits: `\` (horizontal), `-` (vertical)
- Theme: Catppuccin Mocha via TPM
- Session picker: fzf-based via shared script with zsh
- Windows/panes indexed from 1, auto-renumbered

### kitty

OS-templated config: `cmd` modifier on macOS, `alt` on Linux. Nerd Font primary, bl1nk theme. Splits, tabs, and window navigation all use OS-adaptive keybinds.

### ghostty

Flat config with Catppuccin Mocha theme. MonaspiceNe Nerd Font. Custom GLSL cursor shaders (blaze enabled, smear disabled). All keybinds use `cmd+s>` prefix namespace.

### yazi

File manager with 9 plugins (smart-enter, full-border, git, no-status, toggle-pane, chmod, lazygit, simple-status, rich-preview) and 3 flavors (catppuccin-mocha, ayu-dark, tokyo-night). All pinned by commit hash in `package.toml`.

### k9s

Kubernetes TUI with `transparent` skin, custom resource aliases, and 40+ community plugin YAMLs covering ArgoCD, Flux, Helm, crossplane, cert-manager, and more. Two custom kubectl executable plugins: `kubectl-purge` (helm delete) and `kubectl-jq` (log filter).

### fastfetch

Custom JSONC layout with Nerd Font icons. Sections: Hardware (green), Software (yellow), DE/WM (blue), Uptime/Age (magenta). Includes custom OS-age calculation via command module.

### opencode

AI coding agent with multi-layer config:
- `opencode.jsonc` — MCP servers, permissions, plugins, agent colors
- `oh-my-opencode-slim.json` — Model presets (cheap, openai, opencode-go) mapping agent roles
- `tui.json` — TUI keybinds: leader `ctrl+space`

### git

- Delta pager for diffs
- 1Password SSH signing
- Custom delta themes

## Optional Tools

The following are referenced in aliases and functions but are **not** auto-installed by the bootstrap script. Install manually if needed:

| Tool | Description |
|---|---|
| go | Go programming language (PATH config, GOPATH) |
| minikube | Local Kubernetes cluster (`mk`, `mkk` aliases) |
| tofu / opentofu | OpenTofu IaC tool (`tf` alias) |
| bun / pnpm / yarn / deno | JS package managers (used by `pls` function) |
| orbstack | macOS container runtime (shell integration) |
| sesh | Tmux session manager (alternative to built-in session picker) |
| awscli | AWS CLI (used by `awsauth`, `owner`, `awsaccount` functions) |

## Post-Installation Notes

- **Zsh**: Zim modules auto-install on first shell startup. Secrets in `~/.config/zsh/.env.local` are never committed — create manually.
- **Neovim**: Plugins auto-install on first launch via lazy.nvim. Run `:Lazy check` to check for updates.
- **Tmux**: Plugins install with `prefix + I` or automatically during bootstrap.
- **Yazi**: Plugins and flavors are pinned by commit hash in `package.toml`. Run `ya pkg install` after updating hashes.
- **OpenCode**: Requires environment variables for API tokens (see `opencode.jsonc` for expected vars).
- Restart your terminal or `exec zsh` after installation for all changes to take effect.
