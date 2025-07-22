return {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local gitsigns = require "gitsigns"
        gitsigns.setup {
            status_formatter = nil,  -- Use default
            max_file_length = 40000, -- Disable if file is longer than this (in lines)
            current_line_blame = true,
            preview_config = {
                -- Options passed to nvim_open_win
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        }
        vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Open buffer diff" })
        vim.keymap.set("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Toggle current line blame" })
        vim.keymap.set("n", "<leader>gB", gitsigns.blame, { desc = "Open current buffer blame in split" })
        vim.keymap.set("n", "<leader>gw", gitsigns.toggle_word_diff, { desc = "Toggle word diff" })
    end,
}
