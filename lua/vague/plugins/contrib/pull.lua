return {
    "vague2k/pull.nvim",
    dev = true,
    enabled = false, -- not currently working on this
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("pull").setup({})
    end,
}
