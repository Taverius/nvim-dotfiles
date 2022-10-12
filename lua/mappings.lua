--   vi: tw=100
-- lua/mappings.lua @ Leonardo Valeri Manera 2022

local stdconfig = vim.fn.stdpath('config') .. "/vim/mappings"

-- , is mapleader, so rebind ,, to ,
vim.keymap.set({'n', 'v'}, ',,', ',', {silent = true})

-- bind ; to :, and ;; to ;
vim.keymap.set({'n', 'v'}, ';;', ';', {silent = true})
vim.keymap.set({'n', 'v'}, ';', ':')
vim.keymap.set({'n', 'v'}, '<M-;>', ';')
vim.keymap.set({'n', 'v'}, 'q;', 'q:')

-- CTRL-Space toggles folds
vim.keymap.set({'n', 'v'}, "<C-Space>", [[@=(foldlevel('.')?'za':'l')<CR>]], {silent = true, desc = 'Toggle fold under cursor'})
vim.keymap.set('i', "<C-Space>", [[<C-o>@=(foldlevel('.')?'za':'l')<CR>]], {silent = true, desc = 'Toggle fold under cursor'})

-- Let Control-S be 'save' as it is in most other editors
-- Bug: this puts you into insert mode if you were in overwrite mode before
vim.keymap.set({'n', 'v', 'o'}, "<C-s>", ":w<CR>")
vim.keymap.set('i', "<C-s>", "<C-o>:w<CR>")

-- Map Crlt-C directly to ESC
vim.keymap.set('i', "<C-c>", "<ESC>")

-- qq to record, Q to replay
vim.keymap.set('n', 'Q', "@q", {desc = 'Replay macro'})

-- Shift-Enter -> ESC
vim.keymap.set({'n', 'v', 'o'}, "<S-cr>", "<Esc>")

-- \ clears the search pattern
vim.keymap.set('n', [[\]], ":noh<CR>", {silent = true, desc = 'Clear search highlight'})

-- Pressing an 'enter visual mode' key while in visual mode changes mode.
vim.keymap.set('v', "<C-V>", [[<ESC>`<<C-v>`>]])
vim.keymap.set('v', 'V', [[<ESC>`<V`>]])
vim.keymap.set('v', 'v', [[<ESC>`<v`>]])

-- Remove the ^M when the encoding gets messed up
vim.keymap.set({'n', 'v', 'o'}, "<leader>M", [[mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm]], {desc = 'Clear ^M from wrong encoding'})

-- Allows you to stay in visual mode when indenting with < and >
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Useful in long wrapped lines
vim.keymap.set('n', "<C-down>", 'gj', { desc = 'Move down in a wrapped line'})
vim.keymap.set('n', "<C-up>", 'gk', { desc = 'Move up in a wrapped line'})

-- Tag movement
vim.keymap.set('n', "<C-]>", 'g<C-]>')
vim.keymap.set('n', "<C-g>", 'g<C-g>')

-- Quickfix
vim.keymap.set({'n', 'v', 'o'}, "<leader>cc", [[:cclose<bar>lclose<CR>]], {desc = 'Close Quikckfix'})
vim.cmd.source(stdconfig .. "/qfclose.vim")

-- Circular window navigation
vim.keymap.set('n', "<tab>", "<C-w>w", { desc = 'Clockwise window'})
vim.keymap.set('n', "<S-tab>", "<C-w>W", { desc = 'Counter-clockwise window'})

-- Tab configuration
vim.keymap.set('n', "<leader>tn", ":tabnew %<CR>", { desc = 'New tab'})
vim.keymap.set('n', "<leader>te", ":tabedit", { desc = 'Edit tab'})
vim.keymap.set('n', "<leader>tc", ":tabclose<CR>", { desc = 'Close tab'})
vim.keymap.set('n', "<leader>tm", ":tabmove", { desc = 'Move tab'})

-- F2 -> Toggle list
vim.keymap.set({'n', 'v', 'o'}, "<F2>", [[:set list!<CR>:set list?<CR>]], {desc = 'Toggle list'})
vim.keymap.set('i', "<F2>", [[<C-o>:set list!<CR><C-O>:set list?<CR>]], {desc = 'Toggle list'})

-- Spelling
vim.cmd.source(stdconfig .. "/myspelllang.vim")
vim.keymap.set({'n', 'v', 'o'}, "<F4>", [[:setlocal spell!<CR>]], {silent = true, desc = 'Toggle spell'})
vim.keymap.set('i', "<F4>", [[<C-o>:setlocal spell!<CR>]], {silent = true, desc = 'Toggle spell'})
vim.keymap.set({'n', 'v', 'o'}, "<C-F4>", [[:call NViMySpellLang()<CR>]], {silent = true, desc = 'Rotate spelling language'})
vim.keymap.set('i', "<C-F4>", [[<C-o>:call NViMySpellLang()<CR>]], {silent = true, desc = 'Rotate spelling language'})

-- <leader>syn -> show syntax group under cursor
vim.cmd.source(stdconfig .. "/syntaxitem.vim")
vim.keymap.set({'n', 'v', 'o'}, "<Leader>syn", [[:echo NViSyntaxItem()<CR>]], {silent = true, desc = 'Show syntax group under cursor'})

