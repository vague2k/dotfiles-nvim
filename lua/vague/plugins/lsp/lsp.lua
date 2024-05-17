return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "folke/neodev.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lsp_zero = require("lsp-zero")
        lsp_zero.on_attach(function(_, bufnr)
            local bufmap = function(keys, func)
                vim.keymap.set("n", keys, func, { buffer = bufnr })
            end

            bufmap("<leader>r", vim.lsp.buf.rename) -- renames a reference

            bufmap("gd", vim.lsp.buf.definition) -- goto a definition
            bufmap("K", vim.lsp.buf.hover) -- display reference information

            bufmap("<leader>dl", ":Telescope diagnostics bufnr=0<CR>") -- open a list of diagnostics
            bufmap("<leader>d", vim.diagnostic.open_float) -- display diagnostic information
            bufmap("<leader>dn", vim.diagnostic.goto_next) -- goto next diagnostic
            bufmap("<leader>dp", vim.diagnostic.goto_prev) -- goto prev diagnostic
        end)

        lsp_zero.setup()

        require("mason").setup({})
        require("mason-lspconfig").setup({

            -- ensure these LSPs are installed
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "biome",
                "astro",
                "gopls",
                "pyright",
                "cssls",
                "tailwindcss",
                "jsonls",
            },

            -- handlers for specific languages
            handlers = {
                lsp_zero.default_setup,

                lua_ls = function()
                    require("neodev").setup({
                        override = function(root_dir, library)
                            root_dir = root_dir
                            library.plugins = true
                            library.enabled = true
                        end,
                    })
                    require("lspconfig").lua_ls.setup({
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" },
                                },
                                workspace = { checkThirdParty = false },
                                telemetry = { enable = false },
                            },
                        },
                    })
                end,

                tailwindcss = function()
                    local on_attach = function(_, bufnr)
                        -- show specific tailwind class name colors whenever we attach to tailwind lsp
                        require("tailwindcss-colors").buf_attach(bufnr)
                    end

                    require("lspconfig").tailwindcss.setup({
                        on_attach = on_attach,
                    })
                end,
            },
        })
    end,
}
