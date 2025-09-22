return {
    "Exafunction/windsurf.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("codeium").setup {}
    end,
}
