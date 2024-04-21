return {
    "rcarriga/nvim-notify",
    enabled = true,
    config = function()
        require("notify").setup({
            fps = 60,
            background_colour = "#000000", -- im forced to use this because transparency
        })

        -- Let's other plugins that use vim.notify to display message to use notify
        vim.notify = require("notify")
    end,
}
