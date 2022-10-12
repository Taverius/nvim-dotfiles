--   vi: tw=100
-- lua/plugins/is.lua @ Leonardo Valeri Manera 2022

-- vim-asterisk maps
vim.keymap.set({'n', 'v', 'o'}, "*", "<Plug>(asterisk-*)<Plug>(is-nohl-1)", { silent = true, remap = true })
vim.keymap.set({'n', 'v', 'o'}, "g*", "<Plug>(asterisk-g*)<Plug>(is-nohl-1)", { silent = true, remap = true })
vim.keymap.set({'n', 'v', 'o'}, "#", "<Plug>(asterisk-#)<Plug>(is-nohl-1)", { silent = true, remap = true })
vim.keymap.set({'n', 'v', 'o'}, "g#", "<Plug>(asterisk-g#)<Plug>(is-nohl-1)", { silent = true, remap = true })

vim.keymap.set({'n', 'v', 'o'}, "z*", "<Plug>(asterisk-z*)<Plug>(is-nohl-10)", { silent = true, remap = true })
vim.keymap.set({'n', 'v', 'o'}, "gz*", "<Plug>(asterisk-gz*)<Plug>(is-nohl-10)", { silent = true, remap = true })
vim.keymap.set({'n', 'v', 'o'}, "z#", "<Plug>(asterisk-z#)<Plug>(is-nohl-10)", { silent = true, remap = true })
vim.keymap.set({'n', 'v', 'o'}, "gz#", "<Plug>(asterisk-gz#)<Plug>(is-nohl-10)", { silent = true, remap = true })

