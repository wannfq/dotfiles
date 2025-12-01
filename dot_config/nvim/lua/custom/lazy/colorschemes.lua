local theme = "catppuccin" -- tokyonight, catppuccin, kanagawa, onedark, ayu

local function ApplyTheme(colorScheme)
    colorScheme = colorScheme or theme
    vim.cmd.colorscheme(colorScheme)
end

return {
    {
        "folke/tokyonight.nvim",
        lazy = theme ~= "tokyonight",
        priority = 1000,
        config = function()
            require("tokyonight").setup {
                style = "storm", -- Available styles: `storm`, `moon`, a darker variant `night` and `day`
                transparent = true,
                terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                    types = { italic = true, bold = true },
                    sidebars = "dark", -- style for sidebar
                    floats = "dark", -- style for floating windows
                },
                plugins = {
                    lazy = true,
                    blink = true,
                    bufferline = true,
                    gitsigns = true,
                    yanky = true,
                    lualine = true,
                },
            }

            ApplyTheme()

            require("lualine").setup {
                options = {
                    theme = "tokyonight",
                },
            }
        end,
    },

    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = theme ~= "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup {
                flavour = "frappe", -- latte, frappe, macchiato, mocha
                no_italics = false,
                auto_integration = true, -- automatically integrate with other plugins
                transparent_background = true, -- disables setting the background color
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    keywords = { "italic" },
                    types = { "bold", "italic" },
                },
                float = {
                    transparent = true,
                    rounded = true,
                },
                integrations = {
                    cmp = true,
                    gitsigns = {
                        enabled = true,
                        transparent = true,
                    },
                    diffview = true,
                    treesitter = true,
                    notify = true,
                    lsp_trouble = true,
                    snacks = {
                        enabled = true,
                    },
                    blink_cmp = {
                        style = "bordered",
                    },
                    which_key = true,
                    mason = true,
                },
                custom_highlights = function(colors)
                    return {
                        SnacksIndent = { fg = colors.surface0 },
                    }
                end,
            }

            ApplyTheme()
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = theme ~= "kanagawa",
        priority = 1000,
        config = function()
            require("kanagawa").setup {
                theme = "wave", -- Load 'wave', 'dragon' or 'lotus' theme
                background = {
                    dark = "wave",
                    light = "lotus",
                },
                compile = true, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = {},
                typeStyle = { bold = true, italic = true },
                transparent = true, -- do not set background color
                dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                overrides = function(colors)
                    local cTheme = colors.theme
                    local makeDiagnosticColor = function(color)
                        local cLib = require "kanagawa.lib.color"
                        return { fg = color, bg = cLib(color):blend(cTheme.ui.bg, 0.9):to_hex() }
                    end
                    return {
                        DiagnosticVirtualTextHint = makeDiagnosticColor(cTheme.diag.hint),
                        DiagnosticVirtualTextInfo = makeDiagnosticColor(cTheme.diag.info),
                        DiagnosticVirtualTextWarn = makeDiagnosticColor(cTheme.diag.warning),
                        DiagnosticVirtualTextError = makeDiagnosticColor(cTheme.diag.error),
                        SnacksPickerPathIgnored = { fg = colors.palette.springViolet1 },
                        SnacksPickerPathHidden = { fg = colors.palette.springViolet1 },
                    }
                end,
            }

            ApplyTheme()
        end,
    },

    {
        "navarasu/onedark.nvim",
        lazy = theme ~= "onedark",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("onedark").setup {
                style = "cool",
                transparent = true, -- Show/hide background
                code_style = {
                    comments = "italic",
                    keywords = "italic",
                },
                lualine = {
                    transparent = true, -- lualine center bar transparency
                },
                diagnostics = {
                    darker = true, -- darker colors for diagnostic
                    undercurl = true, -- use undercurl instead of underline for diagnostics
                    background = true, -- use background color for virtual text
                },
                highlights = {
                    BlinkCmpMenuSelection = { bg = "$bg2" },
                },
            }
            require("onedark").load()

            ApplyTheme()

            require("lualine").setup {
                options = {
                    theme = "onedark",
                },
            }
        end,
    },

    {
        "Shatur/neovim-ayu",
        lazy = theme ~= "ayu",
        priority = 1000,
        config = function()
            local colors = require "ayu.colors"
            require("ayu").setup {
                mirage = true, -- Enable mirage variant
                overrides = {
                    nontext = { link = "floatborder" },
                    LineNr = { link = "NonText" },
                    Folded = { fg = colors.fg },
                },
            }

            ApplyTheme()

            require("lualine").setup {
                options = {
                    theme = "ayu",
                },
            }

            -- blink cmp
            vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colors.selection_bg })
            vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = colors.ui, italic = true, bold = true })
            vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = colors.fg })
            vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = colors.regexp, bold = true })
        end,
    },
}
