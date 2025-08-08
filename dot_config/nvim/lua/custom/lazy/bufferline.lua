return {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    after = "transparent",
    config = function()
        local bufferline = require "bufferline"
        bufferline.setup {
            options = {
                style_preset = {
                    bufferline.style_preset.minimal, -- no_italic, no_bold, minimal
                    bufferline.style_preset.no_italic,
                },
                themable = true,
                separator_style = { "", "" },
                max_name_length = 24,
                indicator = {
                    icon = "▎", -- (, , 󰘠, , 󰶻) this should be omitted if indicator style is not 'icon'
                    style = "icon",
                },
                show_buffer_close_icons = false,
                show_close_icon = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true, -- use a "true" to enable the default, or set your own character
                    },
                },
            },
        }
    end,
}
