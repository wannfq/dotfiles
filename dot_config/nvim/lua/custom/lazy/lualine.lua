local get_active_lsp = function()
    local message = "No Active Lsp"
    local buffer_ft = vim.api.nvim_get_option_value("filetype", {})
    local clients = vim.lsp.get_clients { bufnr = 0 }

    if next(clients) == nil then
        return message
    end

    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buffer_ft) ~= -1 then
            return client.name
        end
    end
    return message
end

return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        "meuter/lualine-so-fancy.nvim",
        "ofseed/copilot-status.nvim",
    },
    config = function()
        require("lualine").setup {
            options = {
                theme = "auto",
                component_separators = { left = "│", right = "│" },
                section_separators = { left = "", right = "" },
                globalstatus = true,
                refresh = {
                    statusline = 100,
                },
            },
            sections = {
                lualine_a = {
                    {
                        "fancy_mode",
                        width = 8,
                    },
                },
                lualine_b = {
                    { "fancy_branch" },
                    { "fancy_diff" },
                },
                lualine_c = {
                    {
                        "fancy_cwd",
                        substitute_home = true,
                    },
                },
                lualine_x = {
                    { "fancy_macro" },
                    { "fancy_diagnostics" },
                    { "fancy_searchcount" },
                    { "fancy_location" },
                },
                lualine_y = {
                    {
                        "fancy_filetype",
                        ts_icon = "",
                    },
                    {
                        "copilot",
                        show_running = true,
                        symbols = {
                            status = {
                                enabled = " ", -- 
                                disabled = " ",
                            },
                            spinners = require("copilot-status.spinners").dots,
                        },
                    },
                },
                lualine_z = {
                    -- { "fancy_lsp_servers" },
                    {
                        get_active_lsp,
                        icon = "󰒍",
                    },
                },
            },
        }
    end,
}
