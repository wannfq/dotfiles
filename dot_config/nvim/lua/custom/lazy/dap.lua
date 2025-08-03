return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",

        -- dap adapters
        "mxsdev/nvim-dap-vscode-js",
    },
    keys = {
        {
            "<leader>db",
            function()
                require("dap").toggle_breakpoint()
            end,
            desc = "Toggle debug breakpoint",
        },
        {
            "<leader>dw",
            function()
                require("dapui").toggle()
            end,
            desc = "Toggle debug window",
        },
        {
            "<leader>dr",
            function()
                require("dap").continue()
            end,
            desc = "Run debug",
        },
        {
            "<leader>dx",
            function()
                require("dap").disconnect()
                require("dap").terminate()
                require("dap").close()
            end,
            desc = "Terminate debug",
        },
    },
    config = function()
        local dap = require "dap"
        local dapui = require "dapui"

        vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

        for _, language in ipairs { "typescript", "javascript" } do
            dap.configurations[language] = {
                {
                    type = "pwa-node",
                    request = "launch",
                    name = "Launch file",
                    program = "${file}",
                    cwd = "${workspaceFolder}",
                },
                {
                    type = "pwa-node",
                    request = "attach",
                    name = "Attach",
                    processId = require("dap.utils").pick_process,
                    cwd = "${workspaceFolder}",
                },
            }
        end

        dapui.setup()
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        require("dap-vscode-js").setup {
            -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
            adapters = {
                "pwa-node",
                "pwa-chrome",
                "pwa-msedge",
                "node-terminal",
                "pwa-extensionHost",
            },
            debugger_cmd = { "js-debug-adapter" },
            log_file_path = "(stdpath cache)/dap-vscode-js.log", -- Path for file logging
            -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
            -- log_console_level = vim.log.levels.ERROR
        }
    end,
}
