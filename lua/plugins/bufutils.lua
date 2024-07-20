--   vi: tw=100
-- lua/plugins/bufutils.lua @ Leonardo Valeri Manera 2022

-- Some handy mappings
vim.keymap.set({'n', 'v', 'o'}, "<leader>bp", ":BClosePreviews<CR>", {silent = true, desc = "Close preview, help, location buffers"})
vim.keymap.set({'n', 'v', 'o'}, "<leader>ba", ":BCloseAll<CR>", {silent = true, desc = "Close all buffers"})
vim.keymap.set({'n', 'v', 'o'}, "<leader>bc", ":BCloseThis<CR>", {silent = true, desc = "Close this buffer"})
vim.keymap.set({'n', 'v', 'o'}, "<leader>bo", ":BCloseOther<CR>", {silent = true, desc = "Close all other buffers"})
vim.keymap.set({'n', 'v', 'o'}, "<leader>bb", ":BCloseOther<CR>", {silent = true, desc = "Close this buffer, return to previous"})

require("which-key").add({
    { "<leader>b", group = "Buffers" },
})

