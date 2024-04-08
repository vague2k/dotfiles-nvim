return {
    "LintaoAmons/cd-project.nvim",
    dev = true,
    event = { "CmdlineEnter" },
    keys = { "<leader><leader>o" },
    -- Don't need call the setup function if you think you are good with the default configuration
    config = function()
        require("cd-project").setup({
            -- this json file is acting like a database to update and read the projects in real time.
            -- So because it's just a json file, you can edit directly to add more paths you want manually
            projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
            -- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
            project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
            choice_format = "both", -- optional, you can switch to "name" or "path"
            projects_picker = "telescope", -- optional, you can switch to `telescope`
            -- do whatever you like by hooks
            hooks = {
                {
                    callback = function(dir)
                        vim.notify("switched to dir: " .. dir)
                    end,
                },
            },
        })

        local opts = { noremap = true, silent = true }
        local cdpj_adapter = require("cd-project.adapter.init")
        vim.keymap.set("n", "<leader><leader>o", cdpj_adapter.cd_project, opts)
    end,
}
