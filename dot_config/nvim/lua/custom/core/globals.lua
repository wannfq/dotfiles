vim.g.mapleader = " "

vim.g.disable_autoformat = false

vim.lsp.inlay_hint.enable(false)

local signs = {
    ERROR = " ", -- 
    WARN = " ", -- 
    HINT = " ", --󰌵 
    INFO = " ", -- 
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
}
