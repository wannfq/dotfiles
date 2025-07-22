return {
    "gbprod/yanky.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "folke/snacks.nvim" },
    opts = {
        ring = {
            storage = "memory",
            history_length = 20,
        },
        preserve_cursor_position = {
            enabled = true,
        },
    },
    keys = {
        {
            "<leader>sy",
            function()
                Snacks.picker.yanky()
            end,
            mode = { "n", "x" },
            desc = "Open Yank History",
        },
        { "y",     "<Plug>(YankyYank)",                      mode = { "n", "x" },                                desc = "Yank text" },
        { "p",     "<Plug>(YankyPutAfter)",                  mode = { "n", "x" },                                desc = "Put yanked text after cursor" },
        { "P",     "<Plug>(YankyPutBefore)",                 mode = { "n", "x" },                                desc = "Put yanked text before cursor" },
        { "=p",    "<Plug>(YankyGPutAfter)",                 mode = { "n", "x" },                                desc = "Put yanked text after selection" }, -- default gp
        { "=P",    "<Plug>(YankyGPutBefore)",                mode = { "n", "x" },                                desc = "Put yanked text before selection" }, -- default gP
        { "<c-p>", "<Plug>(YankyPreviousEntry)",             desc = "Select previous entry through yank history" },
        { "<c-n>", "<Plug>(YankyNextEntry)",                 desc = "Select next entry through yank history" },
        { "]p",    "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
        { "[p",    "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
        { "]P",    "<Plug>(YankyPutIndentAfterLinewise)",    desc = "Put indented after cursor (linewise)" },
        { "[P",    "<Plug>(YankyPutIndentBeforeLinewise)",   desc = "Put indented before cursor (linewise)" },
        { ">p",    "<Plug>(YankyPutIndentAfterShiftRight)",  desc = "Put and indent right" },
        { "<p",    "<Plug>(YankyPutIndentAfterShiftLeft)",   desc = "Put and indent left" },
        { ">P",    "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
        { "<P",    "<Plug>(YankyPutIndentBeforeShiftLeft)",  desc = "Put before and indent left" },
        { "gp",    "<Plug>(YankyPutAfterFilter)",            desc = "Put after applying a filter" }, -- default =p
        { "gP",    "<Plug>(YankyPutBeforeFilter)",           desc = "Put before applying a filter" }, -- default =P
    },
}
