--   vi: tw=100
-- lua/plugins/splitjoin.lua @ Leonardo Valeri Manera 2022

-- No default mapping
vim.g.splitjoin_split_mapping = ''
vim.g.splitjoin_join_mapping = ''

-- Map manually so we can add a description
vim.keymap.set('n', "<Leader>j", ":SplitjoinJoin<cr>", { silent = true, desc = "Split code block" })
vim.keymap.set('n', "<Leader>s", ":SplitjoinSplit<cr>", { silent = true, desc = "Join code block" })

