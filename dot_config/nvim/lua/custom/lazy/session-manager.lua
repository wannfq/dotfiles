return {
    "Shatur/neovim-session-manager",
    lazy = true,
    event = "VeryLazy",
    config = function()
        local config = require "session_manager.config"
        require("session_manager").setup {
            autoload_mode = config.AutoloadMode.Disabled, -- Available options: Disabled, CurrentDir, LastSession, GitSession
            -- sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"), -- The directory where the session files will be saved.
            autosave_last_session = true, -- Automatically save last session on exit and on session switch.
            autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
            autosave_ignore_dirs = { "/", "~/", "~/Downloads" },
            autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
                "gitcommit",
                "gitrebase",
            },
            autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
            autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
            max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
            load_include_current = false, -- The currently loaded session appears in the load_session UI.
        }

        vim.keymap.set("n", "<leader>Sw", function()
            vim.cmd.SessionManager "load_session"
        end, { desc = "Change Session" })
        vim.keymap.set("n", "<leader>Sx", function()
            vim.cmd.SessionManager "delete_session"
        end, { desc = "Delete Session" })
    end,
}
