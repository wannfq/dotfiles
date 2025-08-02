return {
    "mfussenegger/nvim-lint",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
    },
    keys = {
        {
            "<leader>bl",
            function()
                require("lint").try_lint()
            end,
            desc = "Lint buffer",
        },
    },
    config = function()
        require("lint").linters_by_ft = {
            sh = { "shellcheck" },
            markdown = { "markdownlint", "vale" },
            yaml = { "yamllint" },
            json = { "jsonlint" },
            lua = { "luacheck" },
            javascript = { "eslint_d" },
            typescript = { "eslint_d" },
            go = { "golangcilint" },
        }

        vim.api.nvim_create_autocmd({
            "BufReadPost",
            "InsertLeave",
        }, {
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
