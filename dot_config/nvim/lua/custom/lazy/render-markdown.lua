return {
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        lazy = true,
        event = "BufReadPost",
    },

    {
        "toppair/peek.nvim",
        build = "deno task --quiet build:fast",
        lazy = true,
        event = "BufReadPost",
        config = function()
            local peek = require "peek"
            peek.setup {
                filetype = { "markdown", "conf" },
            }

            Snacks.toggle
                .new({
                    name = "Markdown Preview",
                    get = function()
                        return peek.is_open()
                    end,
                    set = function(state)
                        if state then
                            peek.open()
                        else
                            peek.close()
                        end
                    end,
                    wk_desc = {
                        enabled = "Close ",
                        disabled = "Open ",
                    },
                })
                :map "<leader>tm"
        end,
    },
}
