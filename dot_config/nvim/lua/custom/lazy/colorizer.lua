return {
    "catgoose/nvim-colorizer.lua",
    lazy = true,
    event = "BufReadPre",
    opts = {
        user_default_options = {
            mode = "virtualtext", -- 'background'|'foreground'|'virtualtext'
        },
    },
}
