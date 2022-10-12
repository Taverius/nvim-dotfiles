--   vi: tw=100
-- lua/plugins/undotree.lua @ Leonardo Valeri Manera 2022

-- set layout
vim.g.undotree_WindowLayout = 2
-- <leader>lu -> Undo
vim.keymap.set({'n', 'v', 'o'}, "<leader>lu", ":UndotreeToggle<CR>", {silent = true})

