return {
  "vague2k/huez.nvim",
  dev = true,
  import = "huez-manager.import",
  event = "UIEnter",
  config = function()
    require("huez").setup({
      suppress_messages = false,
      theme_config_module = "vague.plugins.themes",
    })
    vim.keymap.set("n", "<leader>co", ":Huez<CR>", {})
  end,
}
