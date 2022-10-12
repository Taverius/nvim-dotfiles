--   vi: tw=100
-- lua/plugins/bufutils.lua @ Leonardo Valeri Manera 2022

-- Some handy mappings
vim.keymap.set({'n', 'v', 'o'}, "<leader>bp", ":BClosePreviews<CR>", {silent = true})
vim.keymap.set({'n', 'v', 'o'}, "<leader>ba", ":BCloseAll<CR>", {silent = true})
vim.keymap.set({'n', 'v', 'o'}, "<leader>bc", ":BCloseThis<CR>", {silent = true})

