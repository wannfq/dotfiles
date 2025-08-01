return {
    "stevearc/conform.nvim",
    lazy = true,
    event = { "BufReadPost", "BufWritePre" },
    cmd = { "ConformInfo" },
    dependencies = {
        "williamboman/mason.nvim",
    },
    keys = {
        {
            "<leader>bf",
            function()
                require("conform").format { async = true }
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
    config = function()
        require("conform").setup {
            format_on_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return {
                    lsp_fallback = true,
                    timeout_ms = 500,
                }
            end,
            formatters_by_ft = {
                lua = { "stylua", lsp_format = "fallback" },
                python = { "pyright", lspt_format = "fallback" },
                go = { "goimports-reviser", "gofumpt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                yaml = { "prettierd", "prettier", stop_after_first = true },
            },
        }

        Snacks.toggle
            .new({
                name = "Format on Save",
                get = function()
                    return not vim.g.disable_autoformat
                end,
                set = function(state)
                    vim.g.disable_autoformat = not state
                end,
            })
            :map "<leader>tf"
    end,
}
