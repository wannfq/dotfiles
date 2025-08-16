return {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
        require("transparent").setup {
            groups = {
                "Normal",
                "NormalFloat",
                "FloatBorder",
                "FloatTitle",
                "Pmenu",
                "LineNr",
                "Directory",
                "TabLine",
                "TabLineFill",
                "TabLineSel",
                "CursorLine",
                "CursorLineNr",
                "SignColumn",
                "DiagnosticSignHint",
                "DiagnosticSignInfo",
                "DiagnosticSignWarn",
                "DiagnosticSignError",
                "DiagnosticSignError",
                "WinBarNC",
                "StatusLineNC",
                "Folded",

                "LazyNormal",
                "MasonNormal",

                "SnacksPickerBoxTitle",
                "SnacksPickerInputBorder",
                "SnacksPickerInputTitle",
                "StatusLine",
                "BlinkCmpMenu",
                "BlinkCmpMenuBorder",
                "BlinkCmpDoc",
                "BlinkCmpDocBorder",
                "BuferLineFill",
                "BuferLineBackground",
                "BuferLineTab",
                "BuferLineTabSelected",
            },
            extra_groups = {},
            exclude_groups = {},
        }
        require("transparent").clear_prefix "BufferLine"
        require("transparent").clear_prefix "lualine_c"
        require("transparent").clear_prefix "lualine_x"
    end,
}
