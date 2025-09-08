return {
    "NStefan002/screenkey.nvim",
    lazy = true,
    event = "VeryLazy",
    version = "*", -- or branch = "main", to use the latest commit
    config = function()
        require("screenkey").setup {
            win_opts = {
                row = vim.o.lines - vim.o.cmdheight - 1,
                col = vim.o.columns - 1,
                relative = "editor",
                anchor = "SE",
                width = 32,
                height = 3,
                border = "none",
                title = "",
                title_pos = "center",
                style = "minimal",
                focusable = false,
                noautocmd = true,
            },
            compress_after = 3,
            clear_after = 3,
            disable = {
                filetypes = {},
                buftypes = {},
            },
            show_leader = true,
            group_mappings = false,
            display_infront = {},
            display_behind = {},
            filter = function(keys)
                return keys
            end,
            keys = {
                ["<TAB>"] = "󰌒",
                ["<CR>"] = "󰌑",
                ["<ESC>"] = "Esc",
                ["<SPACE>"] = "␣",
                ["<BS>"] = "󰌥",
                ["<DEL>"] = "Del",
                ["<LEFT>"] = "",
                ["<RIGHT>"] = "",
                ["<UP>"] = "",
                ["<DOWN>"] = "",
                ["<HOME>"] = "Home",
                ["<END>"] = "End",
                ["<PAGEUP>"] = "PgUp",
                ["<PAGEDOWN>"] = "PgDn",
                ["<INSERT>"] = "Ins",
                ["<F1>"] = "󱊫",
                ["<F2>"] = "󱊬",
                ["<F3>"] = "󱊭",
                ["<F4>"] = "󱊮",
                ["<F5>"] = "󱊯",
                ["<F6>"] = "󱊰",
                ["<F7>"] = "󱊱",
                ["<F8>"] = "󱊲",
                ["<F9>"] = "󱊳",
                ["<F10>"] = "󱊴",
                ["<F11>"] = "󱊵",
                ["<F12>"] = "󱊶",
                ["CTRL"] = "Ctrl",
                ["ALT"] = "Alt",
                ["SUPER"] = "󰘳",
                ["<leader>"] = "<leader>",
            },
        }

        Snacks.toggle
            .new({
                name = "Screenkey",
                get = function()
                    require("screenkey").is_active()
                end,
                set = function()
                    require("screenkey").toggle()
                end,
            })
            :map "<leader>tS"
    end,
}
