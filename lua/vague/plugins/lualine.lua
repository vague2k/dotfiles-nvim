return {
    "nvim-lualine/lualine.nvim",
    dependecies = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    config = function()
        require("lualine").setup({})
    end,
}
