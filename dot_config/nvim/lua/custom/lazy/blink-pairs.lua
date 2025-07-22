return {
    'saghen/blink.pairs',
    version = '*', -- (recommended) only required with prebuilt binaries
    lazy = true,
    event = { "BufReadPost", "InsertEnter", "CmdlineEnter" },
    dependencies = 'saghen/blink.download',
    opts = {
        mappings = {
            -- you can call require("blink.pairs.mappings").enable() and require("blink.pairs.mappings").disable()
            -- to enable/disable mappings at runtime
            enabled = true,
            -- you may also disable with `vim.g.pairs = false` (global) or `vim.b.pairs = false` (per-buffer)
            disabled_filetypes = {},
            -- see the defaults: https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L12
            pairs = {},
        },
        highlights = {
            enabled = true,
            groups = {
                -- 'BlinkPairsOrange',
                'BlinkPairsPurple',
                'BlinkPairsBlue',
            },
            matchparen = {
                enabled = true,
                group = 'MatchParen',
            },
        },
        debug = false,
    }
}
