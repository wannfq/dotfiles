# nvim files

## Structure

```
~/.config/nvim/
  init.lua                  → require("custom")
  stylua.toml               → StyLua formatter config
  lua/custom/
    init.lua                → require core + lazy_init
    lazy_init.lua           → bootstrap lazy.nvim, spec = "custom.lazy"
    core/
      init.lua              → sources the other core files
      options.lua           → vim.opt settings (tabs, clipboard, undo, folds)
      globals.lua           → mapleader, diagnostic signs
      keymaps.lua           → custom keybinds
    lazy/
      init.lua              → always-loaded plugins (plenary, etc.)
      <plugin>.lua          → one file per plugin, returns lazy.nvim spec
```

## Features

| Feature | Powered by |
|---|---|
| LSP (install, config, diagnostics) | mason, mason-lspconfig, nvim-lspconfig |
| Completion (snippets, sources) | blink-cmp |
| Syntax highlighting & text objects | treesitter, treesitter-textobjects |
| Formatting on save | conform.nvim |
| Linting on save | nvim-lint |
| Git signs, blame, hunk nav | gitsigns |
| Git diff view | diffview |
| Status line & tab line | lualine, bufferline |
| File picker, grep, notifications, dashboard | snacks.nvim |
| Diagnostics list & quickfix | trouble.nvim |
| Inline diagnostics | tiny-inline-diagnostic |
| Debugging (breakpoints, ui) | nvim-dap, nvim-dap-ui |
| AI completion | copilot, codeium |
| Test runner (jest, vitest) | neotest |
| Folding | nvim-origami |
| Text objects, move, split/join | mini (ai, basics, move, splitjoin) |
| Auto-pair brackets/quotes | ultimate-autopair |
| Yank highlight & history | yanky |
| Session restore | session-manager |
| Chezmoi integration | chezmoi.nvim |
| OpenCode integration | opencode.nvim |
## Keymaps

Leader key: `<Space>`

| Key | Action |
|---|---|
| `<Space>sk` | Search keymaps |
| `<Space>sh` | Search help |
| `<Space>sf` | Find files (telescope / snacks.picker) |
| `<Space>sr` | Live grep |
| `<Space>e` | Toggle file explorer |
| `<Space>qq` | Quit |
| `<Space>w` | Save |

## Formatting

StyLua: 4-space indent, spaces, no call parentheses on function calls (`no_call_parentheses = true`).

## Tips

- Run `:Lazy check` to check for plugin updates
- Run `:Mason` to manage LSP servers, formatters, linters
- Run `:checkhealth` to diagnose issues
- Colorschemes auto-installed on first run: tokyonight, catppuccin, kanagawa
- `lazy-lock.json` is ignored by chezmoi — it's generated locally
