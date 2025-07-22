return {
    {
        "echasnovski/mini.ai",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mini.ai").setup()
        end,
    },
    {
        "echasnovski/mini.keymap",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mini.keymap").setup()
            local map_combo = require("mini.keymap").map_combo
            local mode = { "i", "c", "x", "s" }
            map_combo(mode, "jk", "<BS><BS><Esc>")
            map_combo(mode, "kj", "<BS><BS><Esc>")
            map_combo("t", "jk", "<BS><BS><C-\\><C-n>")
            map_combo("t", "kj", "<BS><BS><C-\\><C-n>")
        end,
    },
    {
        "echasnovski/mini.move",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mini.move").setup {
                left = "<M-h>",
                right = "<M-l>",
                down = "<M-j>",
                up = "<M-k>",
                line_left = "<M-h>",
                line_right = "<M-l>",
                line_down = "<M-j>",
                line_up = "<M-k>",
            }
        end,
    },
    {
        "echasnovski/mini.operators",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mini.operators").setup {
                evaluate = {
                    prefix = "g=",
                    func = nil,
                },
                exchange = {
                    prefix = "gx",
                    reindent_linewise = true,
                },
                multiply = {
                    prefix = "gm",
                    func = nil,
                },
                replace = {
                    prefix = "gr",
                    reindent_linewise = true,
                },
                sort = {
                    prefix = "gs",
                    func = nil,
                },
            }
        end,
    },
    {
        "echasnovski/mini.splitjoin",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mini.splitjoin").setup()
        end,
    },
    {
        "echasnovski/mini.basics",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mini.basics").setup()
        end,
    },
}
