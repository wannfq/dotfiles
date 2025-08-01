return {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        require("fidget").setup {
            notification = {
                window = {
                    winblend = 0,
                },
            },
        }
        require("mason").setup {}
        require("mason-lspconfig").setup {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                "pyright",
                "gopls",
            },
        }

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    hint = { enable = true },
                    runtime = {
                        version = "LuaJIT",
                    },
                    diagnostics = {
                        globals = {
                            "globals",
                            "vim",
                            "Snacks",
                        },
                    },
                },
            },
        })

        vim.lsp.config("rust_analyzer", {
            settings = {
                ["rust-analyzer"] = {
                    inlayHints = {
                        bindingModeHints = {
                            enable = false,
                        },
                        chainingHints = {
                            enable = true,
                        },
                        closingBraceHints = {
                            enable = true,
                            minLines = 25,
                        },
                        closureReturnTypeHints = {
                            enable = "never",
                        },
                        lifetimeElisionHints = {
                            enable = "never",
                            useParameterNames = false,
                        },
                        maxLength = 25,
                        parameterHints = {
                            enable = true,
                        },
                        reborrowHints = {
                            enable = "never",
                        },
                        renderColons = true,
                        typeHints = {
                            enable = true,
                            hideClosureInitialization = false,
                            hideNamedConstructor = false,
                        },
                    },
                    cargo = {
                        allFeatures = true,
                    },
                },
            },
        })

        vim.lsp.config("ts_ls", {
            settings = {
                tsserver = {
                    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                    format = { enable = true },
                },
                javascript = {
                    suggest = { autoImports = true, completeFunctionCalls = true },
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
                typescript = {
                    suggest = { autoImports = true, completeFunctionCalls = true },
                    inlayHints = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            },
        })

        vim.lsp.config("gopls", {
            settings = {
                analyses = {
                    unusedparams = true,
                    shadow = true,
                },
                gofumpt = true,
                staticcheck = true,
                completeUnimported = true,
                codelenses = {
                    generate = true,
                    gc_details = true,
                    test = true,
                    tidy = true,
                    upgrade_dependency = true,
                    vendor = true,
                },
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
            },
        })

        vim.lsp.config("remark_ls", {
            settings = {
                remark = {
                    requireConfig = true,
                },
            },
        })
    end,
}
