--   vi: tw=100
-- lua/plugins/nvim-surround.lua @ Leonardo Valeri Manera 2023

require("nvim-surround").setup({
    keymaps = {
        -- The default "S" for Visual-Mode is used by Leap
        visual = "gs",
    }
})

