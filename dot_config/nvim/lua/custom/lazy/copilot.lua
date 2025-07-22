return {
    "github/copilot.vim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        -- Block the normal Copilot suggestions
        vim.api.nvim_create_augroup("github_copilot", { clear = true })
        vim.api.nvim_create_autocmd({ "FileType", "BufUnload" }, {
            group = "github_copilot",
            callback = function(args)
                vim.fn["copilot#On" .. args.event]()
            end,
        })
        vim.fn["copilot#OnFileType"]()

        Snacks.toggle
            .new({
                name = "Copilot ",
                get = function()
                    return require("copilot-status").is_enabled()
                end,
                set = function(state)
                    if state then
                        vim.b.copilot_enabled = 1
                        vim.cmd "Copilot enable"
                    else
                        vim.b.copilot_enabled = 0
                        vim.cmd "Copilot disable"
                    end
                end,
            })
            :map "<leader>tC"
    end,
}
