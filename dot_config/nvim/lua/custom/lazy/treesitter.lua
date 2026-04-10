return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = true,
    event = "VeryLazy",
    branch = "main",
    init = function()
        local ensureInstalled = {
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
            "scss",
            "svelte",
            "tsx",
            "typst",
            "vue",
        }
        local alreadyInstalled = require("nvim-treesitter.config").get_installed()
        local parsersToInstall = vim.iter(ensureInstalled)
            :filter(function(parser)
                return not vim.tbl_contains(alreadyInstalled, parser)
            end)
            :totable()
        require("nvim-treesitter").install(parsersToInstall)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function()
                -- Enable treesitter highlighting and disable regex syntax
                pcall(vim.treesitter.start)
                -- Enable treesitter-based indentation
                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
