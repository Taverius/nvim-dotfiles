--   vi: tw=100
-- lua/plugins/lualine.lua @ Leonardo Valeri Manera 2022

require("lualine").setup {
    extensions = { "fugitive", "fern", "fzf", "quickfix" },
    sections = {
        lualine_x = {
            {
                require("lazy.status").updates,
                cond = require("lazy.status").has_updates,
                color = { fg = "#ff9e64" },
            },
        },
    },
}

