-- vim.opt.guicursor = "" -- block cursor
vim.opt.clipboard = "unnamedplus" -- use system clipborad for yank

vim.opt.number = true
vim.opt.relativenumber = false

-- don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.incsearch = true
vim.opt.hlsearch = false

-- set tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

-- vim.opt.background = "dark"
vim.opt.termguicolors = true

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"
-- vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.list = true
vim.opt.listchars = "trail:·,nbsp:␣,tab:» ,eol: " --  ↴

vim.opt.winborder = "rounded"

vim.opt.updatetime = 200 -- faster completion
vim.opt.timeoutlen = 300

vim.opt.foldenable = true
vim.opt.foldcolumn = "0"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
