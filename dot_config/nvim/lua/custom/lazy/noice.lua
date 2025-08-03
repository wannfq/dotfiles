return {
    "folke/noice.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
        "MunifTanjin/nui.nvim",
        -- `nvim-notify` is only needed, if you want to use the notification view.
        "rcarriga/nvim-notify",
    },
    keys = {
        {
            "<leader>sn",
            function()
                require("noice").cmd "snacks"
            end,
            desc = "Search Notification",
            mode = { "n" },
        },
        {
            "<leader>nh",
            function()
                require("noice").cmd "history"
            end,
            desc = "Notification History",
            mode = { "n" },
        },
        {
            "<leader>nl",
            function()
                require("noice").cmd "last"
            end,
            desc = "Last Notification",
            mode = { "n" },
        },
        {
            "<leader>nd",
            function()
                require("notify").dismiss {
                    pending = true,
                    silent = true,
                }
            end,
            desc = "Dismiss Notification",
            mode = { "n" },
        },
    },
    config = function()
        require("noice").setup {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        }
        require("notify").setup {
            timeout = 2000,
            stages = "static",
            minimum_height = 1,
            minimum_width = 40,
            max_height = function()
                return math.floor(vim.o.lines * 0.6) -- default is 0.75
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.4) -- default is 0.75
            end,
        }
    end,
}
