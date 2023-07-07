--   vi: tw=100
-- lua/plugins/mini.nvim.lua @ Leonardo Valeri Manera 2023

-- mini-ai
require("mini.ai").setup()

-- mini-align
require("mini.align").setup()

-- mini-basics
require("mini.basics").setup({
    options = {
        basic = false
    },
})

-- mini-bracketed
require("mini.bracketed").setup()

-- mini-comment
require("mini.comment").setup()

-- mini-cursorword
require("mini.cursorword").setup()

-- mini-files
require("mini.files").setup({
    windows = {
        preview = true,
    }
})
-- <leader>o -> Mini-Files
vim.keymap.set('n', "<leader>o", ":lua MiniFiles.open()<CR>", { silent = true, desc = "Open Mini-Files" })

-- mini-move
require('mini.move').setup()

