return {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = true,
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        "rafamadriz/friendly-snippets",
        "fang2hou/blink-copilot",
    },
    opts = {
        keymap = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            preset = "default",
            -- ["<C-j>"] = { "select_next", "fallback" },
            -- ["<C-k>"] = { "select_prev", "fallback" },
            ["<M-space>"] = { "show", "show_documentation", "hide_documentation" },
        },
        appearance = {
            -- Adjusts spacing to ensure icons are aligned. 'mono' or 'normal'
            nerd_font_variant = "mono",
        },
        completion = {
            menu = {
                auto_show = true,
                border = "rounded",
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind", gap = 1 },
                    },
                },
            },
            documentation = {
                auto_show = true,
                window = {
                    border = "rounded",
                },
            },
        },
        signature = {
            enabled = true,
            window = {
                border = "rounded",
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "copilot" },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = 100,
                    async = true,
                    opts = {
                        kind_name = "Copilot",
                        kind_icon = " ",
                        debounce = 500,
                    },
                },
            },
        },
    },
    opts_extend = { "sources.default" },
}
