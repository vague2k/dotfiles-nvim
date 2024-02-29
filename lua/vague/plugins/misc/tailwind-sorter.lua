return {
    "laytan/tailwind-sorter.nvim",
    ft = { "jsx", "tsx", "js", "ts", "html", "astro", "mjs", "css" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = true,
}
