--   vi: tw=100
-- lua/plugins/vim-numbertoggle.lua @ Leonardo Valeri Manera 2022

-- F3 -> Toggle relative number
vim.keymap.set({'n', 'v', 'o'}, "<F3>", ":set relativenumber!<cr>", { silent = true })
vim.keymap.set('i', "<F3>", "<C-o>:set relativenumber!<cr>", { silent = true })

