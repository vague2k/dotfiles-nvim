return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ft = { "python" },
    config = function()
        require("ibl").setup()
    end,
}
