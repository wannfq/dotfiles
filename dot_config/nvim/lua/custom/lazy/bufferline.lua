return {
    "akinsho/bufferline.nvim",
    version = "*",
    lazy = false,
    config = function()
        local bufferline = require "bufferline"
        bufferline.setup {
            options = {
                style_preset = {
                    bufferline.style_preset.no_italic,
                    -- bufferline.style_preset.no_bold,
                },
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
