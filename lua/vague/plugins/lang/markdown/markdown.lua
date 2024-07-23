return {
  "MeanderingProgrammer/markdown.nvim",
  ft = { "markdown" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local md = require("render-markdown")
    md.setup()
    md.enable()
  end,
}
