return {
    "vague2k/huez.nvim",
    dev = true,
    import = "huez_manager.manage",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("huez").setup({
            fallback = "zenbones",
        })
        vim.keymap.set("n", "<leader>co", ":Huez<CR>", {})

        --- OLD CONFIG
        -- require("huez").setup({
        --     fallback = "zenbones",
        -- })
        -- local colorscheme = require("huez.api").get_colorscheme()
        -- vim.cmd("colorscheme " .. colorscheme)
        --
        -- vim.keymap.set("n", "<leader>co", ":Huez<CR>", {})
    end,
}
