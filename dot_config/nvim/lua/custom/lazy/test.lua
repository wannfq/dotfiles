return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-neotest/nvim-nio",

        -- neotest adapters
        "nvim-neotest/neotest-jest",
        "marilari88/neotest-vitest",
    },
    keys = {
        {
            "<leader>ctt",
            function()
                require("neotest").run.run()
            end,
            desc = "Run nearest test",
        },
        {
            "<leader>ctw",
            function()
                require("neotest").run.run {
                    jestCommand = "jest --watch ",
                    vitestCommand = "vitest --watch",
                }
            end,
            desc = "Run nearest test in watch mode",
        },
        {
            "<leader>cts",
            function()
                require("neotest").summary.toggle()
            end,
            desc = "Toggle test summary",
        },
        {
            "<leader>ctf",
            function()
                require("neotest").run.run(vim.fn.expand "%")
            end,
            desc = "Run tests on file",
        },
        {
            "<leader>cto",
            function()
                require("neotest").output_panel.toggle()
            end,
            desc = "Toggle test output panel",
        },
    },
    config = function()
        require("neotest").setup {
            discovery = {
                enabled = true,
            },
            adapters = {
                require "neotest-jest" {
                    jestCommand = "pnpm test --",
                    jestConfigFile = "jest.config.ts",
                    env = { CI = false },
                    cwd = function()
                        return vim.fn.getcwd()
                    end,
                },
                require "neotest-vitest" {
                    filter_dir = function(name)
                        return name ~= "node_modules"
                    end,
                },
            },
        }
    end,
}
