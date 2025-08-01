return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local configs = require "nvim-treesitter.configs"
        -- https://github.com/nvim-treesitter/nvim-treesitter
        configs.setup {
            ensure_installed = {
                "bash",
                "c",
                "diff",
                "elixir",
                "go",
                "hcl",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "powershell",
                "python",
                "regex",
                "rust",
                "terraform",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
}
