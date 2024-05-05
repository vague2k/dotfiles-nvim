return {
    "nvim-lualine/lualine.nvim",
    dependecies = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    config = function()
        require("lualine").setup({
            options = {
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                always_divide_middle = false,
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
        })
    end,
}
