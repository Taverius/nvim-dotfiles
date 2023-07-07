--   vi: tw=100
-- lua/plugins/mini.nvim.lua @ Leonardo Valeri Manera 2023

-- mini-ai
require("mini.ai").setup()

-- mini-align
require("mini.align").setup()

-- mini-basics
require("mini.basics").setup(
    options = {
        basic = false
    },
)

-- mini-bracketed
require('mini.bracketed').setup()

-- mini-comment
require('mini.comment').setup()

