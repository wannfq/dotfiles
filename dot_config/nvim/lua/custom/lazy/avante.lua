return {
    "yetone/avante.nvim",
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    -- ⚠️ must add this setting! ! !
    -- build = vim.fn.has "win32" ~= 0
    --     and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    --     or "make",
    event = "VeryLazy",
    lazy = true,
    version = false, -- Never set this value to "*"! Never!
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "folke/snacks.nvim", -- for input provider snacks
        {
            -- support for image pasting
            "HakonHarnes/img-clip.nvim",
            event = "VeryLazy",
            opts = {
                -- recommended settings
                default = {
                    embed_image_as_base64 = false,
                    prompt_for_file_name = false,
                    drag_and_drop = {
                        insert_mode = true,
                    },
                    -- required for Windows users
                    use_absolute_path = true,
                },
            },
        },
        {
            -- Make sure to set this up properly if you have lazy=true
            "MeanderingProgrammer/render-markdown.nvim",
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
    ---@module 'avante'
    ---@type avante.Config
    opts = {
        instructions_file = "avante.md",
        behaviour = {
            auto_add_current_file = false,
        },
        provider = "opencode",
        acp_providers = {
            ["opencode"] = {
                command = "opencode",
                args = { "acp" },
            },
        },
        providers = {},
        input = {
            provider = "snacks",
            provider_opts = {
                title = "Avante Input",
                icon = " ",
            },
        },
        selector = {
            provider = "snacks",
            provider_opts = {},
        },
    },
    keys = {},
}
