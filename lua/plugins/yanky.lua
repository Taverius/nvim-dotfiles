--   vi: tw=100
-- lua/plugins/yanky.lua @ Leonardo Valeri Manera 2022

require("yanky").setup({})

-- Bindings
-- Override the default p
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)", { remap = true, desc = "Yanky Put After" })
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)", { remap = true, desc = "Yanky Put Before" })
-- Also replace the default gp with yoink paste so we can toggle paste in this case too
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)", { remap = true, desc = "Yanky GPut After" })
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)", { remap = true, desc = "Yanky GPut Before" })
-- Swap paste back & forth in history
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)", { remap = true, desc = "Yanky Cycle forward" })
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)", { remap = true, desc = "Yanky Cycle backward" })

