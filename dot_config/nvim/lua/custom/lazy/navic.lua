return {
    "SmiteshP/nvim-navic",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-navic").setup {
            separator = "  ",
            highlight = true,
            depth_limit = 8,
            depth_limit_indicator = "...",
            lsp = {
                auto_attach = true,
                preference = nil,
            },
            -- VSCode-like icons
            icons = {
                File = " ",
                Module = " ",
                Namespace = " ",
                Package = " ",
                Class = " ",
                Method = " ",
                Property = " ",
                Field = " ",
                Constructor = " ",
                Enum = " ",
                Interface = " ",
                Function = " ",
                Variable = " ",
                Constant = " ",
                String = " ",
                Number = " ",
                Boolean = " ",
                Array = " ",
                Object = " ",
                Key = " ",
                Null = " ",
                EnumMember = " ",
                Struct = " ",
                Event = " ",
                Operator = " ",
                TypeParameter = " ",
            },
        }

        vim.opt.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

        vim.api.nvim_set_hl(0, "NavicText", { link = "Delimiter" })
        vim.api.nvim_set_hl(0, "NavicSeparator", { link = "LineNr" })
    end,
}
