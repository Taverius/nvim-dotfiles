--   vi: tw=100
-- lua/plugins/yanky.lua @ Leonardo Valeri Manera 2022

require("yanky").setup({})

-- Bindings
-- Override the default p
vim.keymap.set({"n","x"}, "p", "<Plug>(YankyPutAfter)")
vim.keymap.set({"n","x"}, "P", "<Plug>(YankyPutBefore)")
-- Also replace the default gp with yoink paste so we can toggle paste in this case too
vim.keymap.set({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
-- Swap paste back & forth in history
vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")

