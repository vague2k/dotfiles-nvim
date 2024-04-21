return {
    dir = vim.fs.normalize("~/Documents/GitHub/pull.nvim"),
    config = function()
        require("pull").setup({
            -- The root directory that you want the plugin to scan for git repos and show in the telescope picker.
            -- It is normalized for you and by default it's "~/Documents"
            projects_source = "~/Documents/GitHub",
            -- An list of any miscallenous projects you want to include in the telescope picker that are not in projects_source
            -- By default it's an empty list
            misc = {},
        })
    end,
}
