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
            },
        }

        local signs = {
            ERROR = " ", --  
            WARN = " ", --  
            HINT = " ", -- 󰌵  󰮍 
            INFO = " ", --  
        }

        vim.diagnostic.config {
            update_in_insert = true, -- Might impact performance
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = signs.ERROR,
                    [vim.diagnostic.severity.WARN] = signs.WARN,
                    [vim.diagnostic.severity.HINT] = signs.HINT,
                    [vim.diagnostic.severity.INFO] = signs.INFO,
                },
            },
            virtual_text = false, -- overriden by tiny-inline-diagnostic
            -- virtual_text = {
            --     current_line = true,
            --     prefix = "",
            --     -- prefix = function(diagnostic)
            --     --     local severity = diagnostic.severity
            --     --     local severityName = vim.diagnostic.severity[severity]
            --     --     return signs[severityName] or ""
            --     -- end,
            -- },
            -- float = {
            --     focusable = false,
            --     style = "minimal",
            --     border = "rounded",
            --     source = "always",
            --     header = "",
            --     prefix = "",
            --     scope = "line",
            -- },
        }
    end,
}
