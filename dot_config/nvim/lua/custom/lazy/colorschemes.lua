local theme = "kanagawa"

local function ApplyColor(color)
    color = color or theme
    vim.cmd.colorscheme(color)
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

            ApplyColor()

            require("lualine").setup {
                options = {
                    theme = "tokyonight",
                },
            }
        end,
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = theme ~= "rose-pine",
        priority = 1000,
        config = function()
            require("rose-pine").setup {
                variant = "main",
                disable_background = true,
                styles = {
                    bold = true,
                    italic = true,
                    transparency = true,
                },
            }

            ApplyColor()

            local highlights = require "rose-pine.plugins.bufferline"
            require("bufferline").setup { highlights = highlights }
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
                transparent_background = true, -- disables setting the background color
                styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                    comments = { "italic" }, -- Change the style of comments
                    conditionals = { "italic" },
                    keywords = { "italic" },
                    types = { "bold" },
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
                        enabled = false,
                        indent_scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                    },
                    blink_cmp = {
                        style = "bordered",
                    },
                },
            }

            ApplyColor()
        end,
    },

    {
        "rebelot/kanagawa.nvim",
        lazy = theme ~= "kanagawa",
        priority = 1000,
        config = function()
            require("kanagawa").setup {
                theme = "wave", -- Load 'wave', 'dragon' or 'lotus' theme
                compile = false, -- enable compiling the colorscheme
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
                    local cs = colors.theme
                    local makeDiagnosticColor = function(color)
                        local c = require "kanagawa.lib.color"
                        return { fg = color, bg = c(color):blend(cs.ui.bg, 0.9):to_hex() }
                    end
                    return {
                        DiagnosticVirtualTextHint = makeDiagnosticColor(cs.diag.hint),
                        DiagnosticVirtualTextInfo = makeDiagnosticColor(cs.diag.info),
                        DiagnosticVirtualTextWarn = makeDiagnosticColor(cs.diag.warning),
                        DiagnosticVirtualTextError = makeDiagnosticColor(cs.diag.error),
                    }
                end,
            }

            ApplyColor()
        end,
    },

    {
        "loctvl842/monokai-pro.nvim",
        lazy = theme ~= "monokai-pro",
        priority = 1000,
        config = function()
            require("monokai-pro").setup {
                filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
                transparent_background = true,
                terminal_colors = true,
                devicons = true, -- highlight the icons of `nvim-web-devicons`
                styles = {
                    comment = { italic = true },
                    keyword = { italic = true }, -- any other keyword
                    type = { italic = true, bold = true }, -- (preferred) int, long, char, etc
                },
                inc_search = "background", -- underline | background
                background_clear = {
                    "bufferline",
                    "float_win",
                    "which-key",
                },
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                    },
                },
                overrides = function(colors)
                    return {
                        BlinkCmpMenuSelection = { bg = colors.base.dark },
                    }
                end,
            }

            ApplyColor()

            require("lualine").setup {
                options = {
                    theme = "monokai-pro",
                },
            }
        end,
    },

    {
        "navarasu/onedark.nvim",
        lazy = theme ~= "onedark",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("onedark").setup {
                style = "dark",
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

            ApplyColor()

            require("lualine").setup {
                options = {
                    theme = "onedark",
                },
            }
        end,
    },

    {
        "marko-cerovac/material.nvim",
        lazy = theme ~= "material",
        priority = 1000,
        config = function()
            require("material").setup {
                contrast = {
                    sidebars = true, -- Enable contrast for sidebars like NvimTree
                    floating_windows = true, -- Enable contrast for floating windows
                    lsp_virtual_text = true, -- Enable contrasted background for lsp virtual text
                },
                styles = { -- Give comments style such as bold, italic, underline etc.
                    comments = {
                        italic = true,
                    },
                    keywords = {
                        italic = true,
                    },
                    types = {
                        bold = true,
                        italic = true,
                    },
                },
                disable = {
                    background = true,
                },
                plugins = {
                    "blink",
                    "dashboard",
                    "fidget",
                    "gitsigns",
                    "nvim-cmp",
                    "nvim-web-devicons",
                    "trouble",
                    "which-key",
                },
                lualine_style = "stealth",
            }

            vim.g.material_style = "darker" -- oceanic | palenight | deep ocean | lighter | darker

            ApplyColor()

            require("lualine").setup {
                options = {
                    theme = "material",
                },
            }
        end,
    },

    {
        "EdenEast/nightfox.nvim",
        lazy = theme ~= "nightfox", -- nightfox, duskfox, terafox, carbonfox
        priority = 1000,
        config = function()
            require("nightfox").setup {
                options = {
                    transparent = true, -- Disable setting background
                    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    styles = { -- Style to be applied to different syntax groups
                        comments = "italic", -- Value is any valid attr-list value `:help attr-list`
                        keywords = "italic",
                        types = "italic,bold",
                    },
                    module_default = true,
                },
            }

            ApplyColor()

            require("lualine").setup {
                options = {
                    theme = "nightfox",
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
                overrides = {},
            }

            ApplyColor()

            require("lualine").setup {
                options = {
                    theme = "ayu",
                },
            }

            vim.api.nvim_set_hl(0, "NonText", { link = "FloatBorder" })
            vim.api.nvim_set_hl(0, "LineNr", { link = "NonText" })
            vim.api.nvim_set_hl(0, "Folded", { fg = colors.fg })
            vim.api.nvim_set_hl(0, "BlinkCmpMenuSelection", { bg = colors.selection_bg })
            vim.api.nvim_set_hl(0, "BlinkCmpKind", { fg = colors.ui, italic = true, bold = true })
            vim.api.nvim_set_hl(0, "BlinkCmpLabel", { fg = colors.fg })
            vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { fg = colors.regexp, bold = true })
        end,
    },
}
