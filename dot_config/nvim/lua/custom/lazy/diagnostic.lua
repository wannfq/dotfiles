return {
    "rachartier/tiny-inline-diagnostic.nvim",
    lazy = true,
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
        require("tiny-inline-diagnostic").setup {
            preset = "simple", -- "modern", "classic", "minimal", "simple", "powerline"
            signs = {
                diag = "",
                arrow = " ",
            },
            hi = {
                background = "",
            },
            show_source = {
                if_many = true,
            },
        }
    end,
}
