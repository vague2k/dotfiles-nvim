return {
    "hrsh7th/nvim-cmp",
    event = { "BufEnter", "CmdlineEnter" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        require("luasnip.loaders.from_vscode").lazy_load()
        luasnip.config.setup({})

        local icons = {
            Array = "  ",
            Boolean = "  ",
            Class = "  ",
            Color = "  ",
            Constant = "  ",
            Constructor = "  ",
            Enum = "  ",
            EnumMember = "  ",
            Event = "  ",
            Field = "  ",
            File = "  ",
            Folder = "  ",
            Function = "  ",
            Interface = "  ",
            Key = "  ",
            Keyword = "  ",
            Method = "  ",
            Module = "  ",
            Namespace = "  ",
            Null = " ﳠ ",
            Number = "  ",
            Object = "  ",
            Operator = "  ",
            Package = "  ",
            Property = "  ",
            Reference = "  ",
            Snippet = "  ",
            String = "  ",
            Struct = "  ",
            Text = "  ",
            TypeParameter = "  ",
            Unit = "  ",
            Value = "  ",
            Variable = "  ",
        }

        cmp.setup({

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },

            formatting = {
                expandable_indicator = true,
                fields = { "menu", "abbr", "kind" },
                format = function(entry, item)
                    item.kind = (icons[item.kind] or "") .. item.kind
                    item.menu = ({
                        nvim_lsp = "[LSP]",
                        buffer = "[BUF]",
                        luasnip = "[SNIP]",
                        path = "[PATH]",
                    })[entry.source.name]
                    return item
                end,
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            mapping = cmp.mapping.preset.insert({
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete({}),
                ["<CR>"] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                }),
            }),

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
        })
    end,
}
