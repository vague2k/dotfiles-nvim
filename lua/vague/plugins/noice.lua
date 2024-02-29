return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
    config = function()
        require("notify").setup({
            fps = 60,
            background_colour = "#000000",
        })
        require("noice").setup({
            cmdline = {
                enabled = true,
                view = "cmdline",
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
                hover = {
                    silent = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        })
    end,
}
