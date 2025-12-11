return {
    "Exafunction/windsurf.nvim",
    disabled = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("codeium").setup {}
    end,
}
