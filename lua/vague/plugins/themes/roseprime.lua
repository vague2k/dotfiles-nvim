---@type Huez.ThemeConfig
local M = {
    set_theme = function(theme)
        local n = require("neomodern")
        n.setup({
            style = "roseprime",
            code_style = {
                keyword_return = "italic",
                strings = "italic",
            },
        })
        vim.cmd.colorscheme(theme)
        return true
    end,
}

return M
