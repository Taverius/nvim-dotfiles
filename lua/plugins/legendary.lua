--   vi: tw=100
-- lua/plugins/legendary.lua @ Leonardo Valeri Manera 2022

local legendary = require("legendary")

legendary.setup({ auto_register_which_key = true })

local filters = require("legendary.filters")

vim.keymap.set({'n', 'v', 'o'}, '<leader>ha',
    function() legendary.find({ kind = 'autocmds' }) end,
    { desc = "Legendary autocommands" })
vim.keymap.set({'n', 'v', 'o'}, '<leader>hf',
    function() require("legendary").find({ kind = 'functions' }) end,
    { desc = "Legendary functions" })
vim.keymap.set({'n', 'v', 'o'}, '<leader>hc',
    function() require("legendary").find({ kind = 'commands' }) end,
    { desc = "Legendary commands" })
vim.keymap.set({'n', 'v', 'o'}, '<leader>hkm',
    function() require("legendary").find({ kind = 'keymaps', filters  = filters.current_mode() }) end,
    { desc = "Legendary keymaps (current)" })
vim.keymap.set({'n', 'v', 'o', 'i', 'c', 't'}, '<C-k>',
    function() require("legendary").find({ kind = 'keymaps', filters  = filters.current_mode() }) end,
    { desc = "Legendary keymaps (current)" })
vim.keymap.set({'n', 'v', 'o'}, '<leader>hki',
    function() require("legendary").find({ kind = 'keymaps', filters  = filters.mode('i') }) end,
    { desc = "Legendary keymaps (insert)" })
vim.keymap.set({'n', 'v', 'o'}, '<leader>hkc',
    function() require("legendary").find({ kind = 'keymaps', filters  = filters.mode('c') }) end,
    { desc = "Legendary keymaps (command)" })
vim.keymap.set({'n', 'v', 'o'}, '<leader>hkt',
    function() require("legendary").find({ kind = 'keymaps', filters  = filters.mode('t') }) end,
    { desc = "Legendary keymaps (terminal)" })

