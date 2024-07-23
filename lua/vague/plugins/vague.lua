return {
  "vague2k/vague.nvim",
  dev = true,
  config = function()
    require("vague").setup({
      style = {
        keywords = "bold",
        keyword_return = "italic",
      },
    })
  end,
}
