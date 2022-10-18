--   vi: tw=100
-- lua/plugins/vim-numbertoggle.lua @ Leonardo Valeri Manera 2022

-- F3 -> Toggle relative number
vim.keymap.set({'n', 'v', 'o', 'i'}, "<F3>",
    function()
        vim.wo.relativenumber = not vim.wo.relativenumber
    end,
    { desc = "Toggle relative numbers" })

