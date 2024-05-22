return {
    "folke/zen-mode.nvim",
    keys = { "<leader>zo" },
    config = function()
        local zenmode = require("zen-mode")
        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>zo", zenmode.toggle, opts) -- Find files
    end,
}
