--   vi: tw=100
-- lua/plugins/vim-bookmarks.lua @ Leonardo Valeri Manera 2022

vim.g.bookmark_no_default_key_mappings = 1
vim.g.bookmark_manage_per_buffer = 1
vim.keymap.set({'n', 'v', 'o'}, "<F5>", "<Plug>BookmarkToggle", { remap = true, silent = true })
vim.keymap.set({'n', 'v', 'o'}, "<F6>", "<Plug>BookmarkNext", { remap = true, silent = true })
vim.keymap.set({'n', 'v', 'o'}, "<F7>", "<Plug>BookmarkPrev", { remap = true, silent = true })

