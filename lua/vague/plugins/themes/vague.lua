---@type Huez.ThemeConfig
local M = {
  set_theme = function(theme)
    require("vague").setup({
      style = {
        boolean = "bold",
        error = "bold",
        keyword_return = "italic",
        builtin_constants = "bold",
        builtin_types = "bold",
      },
    })
    vim.cmd.colorscheme(theme)
    return true
  end,
}

return M
