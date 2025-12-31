return {
    "chrisgrieser/nvim-origami",
    lazy = true,
    event = "VeryLazy",
    opts = {
        useLspFoldsWithTreesitterFallback = {
            enabled = true,
        },
        pauseFoldsOnSearch = true,
        foldtext = {
            enabled = true,
            padding = 2,
            lineCount = {
                template = "󰁂 %d", -- `%d` is replaced with the number of folded lines
                hlgroup = "Folded",
            },
            diagnosticsCount = true, -- uses hlgroups and icons from `vim.diagnostic.config().signs`
            gitsignsCount = true, -- requires `gitsigns.nvim`
        },
        autoFold = {
            enabled = true,
            kinds = {
                "comment",
                -- "imports",
            },
        },
        foldKeymaps = {
            setup = true, -- modifies `h` and `l`
            hOnlyOpensOnFirstColumn = false,
        },
    },
    config = function(_, opts)
        require("origami").setup(opts)

        vim.keymap.set("n", "<Left>", function()
            require("origami").h()
        end)
        vim.keymap.set("n", "<Right>", function()
            require("origami").l()
        end)
    end,
}
