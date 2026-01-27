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
            local move = require("mini.move")
            move.setup {
                mappings = {
                    left = "<M-h>",
                    right = "<M-l>",
                    down = "<M-j>",
                    up = "<M-k>",
                    line_left = "<M-h>",
                    line_right = "<M-l>",
                    line_down = "<M-j>",
                    line_up = "<M-k>",
                },
            }

            -- Add arrow key support
            vim.keymap.set("v", "<M-Left>", function() move.move_selection("left") end, { desc = "Move selection left" })
            vim.keymap.set("v", "<M-Right>", function() move.move_selection("right") end, { desc = "Move selection right" })
            vim.keymap.set("v", "<M-Down>", function() move.move_selection("down") end, { desc = "Move selection down" })
            vim.keymap.set("v", "<M-Up>", function() move.move_selection("up") end, { desc = "Move selection up" })
            vim.keymap.set("n", "<M-Left>", function() move.move_line("left") end, { desc = "Move line left" })
            vim.keymap.set("n", "<M-Right>", function() move.move_line("right") end, { desc = "Move line right" })
            vim.keymap.set("n", "<M-Down>", function() move.move_line("down") end, { desc = "Move line down" })
            vim.keymap.set("n", "<M-Up>", function() move.move_line("up") end, { desc = "Move line up" })
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
                    all = "gr",
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
    {
        "echasnovski/mini.pairs",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mini.pairs").setup {
                modes = { insert = true, command = false, terminal = false },
            }
        end,
    },
    {
        "echasnovski/mini.surround",
        version = "*",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("mini.surround").setup {
                highlight_duration = 500,
                mappings = {
                    add = "sa", -- Add surrounding in Normal and Visual modes
                    delete = "sd", -- Delete surrounding
                    find = "sf", -- Find surrounding (to the right)
                    find_left = "sF", -- Find surrounding (to the left)
                    highlight = "sh", -- Highlight surrounding
                    replace = "sr", -- Replace surrounding
                    update_n_lines = "sn", -- Update `n_lines`

                    suffix_last = "l", -- Suffix to search with "prev" method
                    suffix_next = "n", -- Suffix to search with "next" method
                },
            }
        end,
    },
}
