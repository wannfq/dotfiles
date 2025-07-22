return {
    "sindrets/diffview.nvim",
    lazy = true,
    cmd = { "DiffviewOpen", "DiffviewClose" },
    keys = {
        { "<leader>gD", "<cmd>DiffviewOpen<CR>", desc = "Open diff view" },
    },
    config = function()
        require("diffview").setup {
            keymaps = {
                view = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
                },
                file_panel = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
                },
                file_history_panel = {
                    { "n", "q", "<cmd>DiffviewClose<cr>", { desc = "Close" } },
                },
            },
        }
        vim.opt.fillchars:append { diff = " " } -- ╱
    end,
}
