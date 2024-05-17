return {
    "vague2k/huez.nvim",
    dev = true,
    import = "huez_manager.manage",
    event = "UIEnter",
    config = function()
        require("huez").setup({
            fallback = "zenbones",
        })
        vim.keymap.set("n", "<leader>co", ":Huez<CR>", {})
    end,
}
