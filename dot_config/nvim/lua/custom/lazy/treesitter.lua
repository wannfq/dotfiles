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
                "astro",
                "bash",
                "c",
                "css",
                "diff",
                "elixir",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
                "go",
                "gomod",
                "gosum",
                "gowork",
                "hcl",
                "html",
                "javascript",
                "json",
                "jsonc",
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
                "xml",
                "yaml",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        }
        vim.filetype.add {
            extension = {
                mdx = "mdx",
                zsh = "zsh",
            },
        }
        vim.treesitter.language.register("markdown", "mdx")
        vim.treesitter.language.register("bash", "zsh")
    end,
}
