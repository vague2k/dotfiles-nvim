return {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
        "nvimtools/none-ls.nvim",
    },
    config = function()
        require("mason-null-ls").setup({
            -- ensure these formatters are installed
            ensure_installed = {
                "stylua",
                "biome",
                "prettier",
                "isort",
                "black",
                "gofumpt",
                "jq",
            },
        })
    end,
}
