return {
    "vague2k/huez.nvim",
    dev = true,
    dependencies = {
        "MunifTanjim/nui.nvim",
        "grapp-dev/nui-components.nvim",
    },
    config = function()
        require("huez").setup({})
        vim.keymap.set("n", "<leader>co", ":Huez<CR>", {})
    end,
}
