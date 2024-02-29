return {
    "goolord/alpha-nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        local devicons = require("nvim-web-devicons.icons-default")

        local lazy = require("lazy")
        local lazy_stats = require("lazy.stats")

        local git = devicons.icons_by_filename[".gitignore"].icon
        local conf = devicons.icons_by_file_extension["conf"].icon
        local file = devicons.icons_by_file_extension["txt"].icon
        local plug = devicons.icons_by_filename["webpack"].icon

        dashboard.section.header.val = {
            [[          ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ]],
            [[           ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
            [[                 ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ]],
            [[                  ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
            [[                 ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
            [[          ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
            [[         ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
            [[        ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
            [[        ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ]],
            [[             ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
            [[              ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
            [[                                          ]],
            [[Do you ever take the time to breath everything in?]],
        }

        dashboard.section.buttons.val = {
            dashboard.button("f", file .. "  >  Find file", ":Telescope find_files<CR>"),
            dashboard.button("u", plug .. "  >  Update Plugins", ":Lazy update<CR>"),
            dashboard.button("c", git .. "  >  Cd Project", ":CdProject<CR>"),
            dashboard.button("s", conf .. "  >  Nvim Config", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
        }

        dashboard.section.footer.val = {
            [[ ]],
            string.format(
                "Neovim has loaded %d plugins in %.2fms (%d plugins and modules have been cached)",
                lazy.stats().loaded,
                lazy_stats.cputime(),
                lazy.stats().count
            ),
        }

        alpha.setup(dashboard.opts)
    end,
}
