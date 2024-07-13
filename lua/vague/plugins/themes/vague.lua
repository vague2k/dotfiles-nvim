---@type Huez.ThemeConfig
local M = {
    set_theme = function(theme)
        require("vague").setup({
            style = {
                keyword_return = "italic",
            },
        })
        vim.cmd.colorscheme(theme)
        return true
    end,
}

return M
