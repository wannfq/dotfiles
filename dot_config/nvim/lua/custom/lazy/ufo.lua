return {
    "kevinhwang91/nvim-ufo",
    lazy = true,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
        "kevinhwang91/promise-async",
        "neovim/nvim-lspconfig",
    },
    config = function()
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }
        local language_servers = vim.lsp.get_clients()
        for _, ls in ipairs(language_servers) do
            require("lspconfig")[ls].setup {
                capabilities = capabilities,
            }
        end

        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (" 󰁂 %d "):format(endLnum - lnum) -- 󰁂
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
        end

        require("ufo").setup {
            provider_selector = function()
                return { "lsp", "indent" }
            end,
            fold_virt_text_handler = handler,
        }

        vim.api.nvim_set_hl(0, "UfoFoldedEllipsis", { link = "Folded" })

        vim.o.foldenable = true
        vim.o.foldcolumn = "0"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
    end,
}
