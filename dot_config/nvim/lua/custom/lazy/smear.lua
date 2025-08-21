return {
    "sphamba/smear-cursor.nvim",
    lazy = true,
    event = "VeryLazy",
    enabled = vim.env.TERM == "xterm-ghostty",
    opts = {},
}
