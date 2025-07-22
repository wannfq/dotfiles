return {
    "Shatur/neovim-session-manager",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local config = require "session_manager.config"
        require("session_manager").setup {
            -- Available options: Disabled, CurrentDir, LastSession, GitSession
            autoload_mode = config.AutoloadMode.Disabled,
            autosave_ignore_dirs = { "/", "~/", "~/Downloads" }
        }
    end,
}
