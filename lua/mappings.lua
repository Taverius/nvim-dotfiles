--   vi: tw=100
-- lua/mappings.lua @ Leonardo Valeri Manera 2022

local stdconfig = vim.fn.stdpath('config') .. "/vim/mappings"
local cmd = vim.cmd
local map = vim.keymap.set

-- , is mapleader, so rebind ,, to ,
map({'n', 'v'}, ',,', ',', {silent = true})

-- bind ; to :, and ;; to ;
map({'n', 'v'}, ';;', ';', {silent = true})
map({'n', 'v'}, ';', ':')
map({'n', 'v'}, '<M-;>', ';')
map({'n', 'v'}, 'q;', 'q:')

-- CTRL-Space toggles folds
map({'n', 'v'}, "<C-Space>", [[@=(foldlevel('.')?'za':'l')<CR>]], {silent = true, desc = 'Toggle fold under cursor'})
map('i', "<C-Space>", [[<C-o>@=(foldlevel('.')?'za':'l')<CR>]], {silent = true, desc = 'Toggle fold under cursor'})

-- Let Control-S be 'save' as it is in most other editors
-- Bug: this puts you into insert mode if you were in overwrite mode before
map({'n', 'v', 'o'}, "<C-s>", ":w<CR>")
map('i', "<C-s>", "<C-o>:w<CR>")

-- Map Crlt-C directly to ESC
map('i', "<C-c>", "<ESC>")

-- qq to record, Q to replay
map('n', 'Q', "@q", {desc = 'Replay macro'})

-- Shift-Enter -> ESC
map({'n', 'v', 'o'}, "<S-cr>", "<Esc>")

-- \ clears the search pattern
map('n', [[\]], ":noh<CR>", {silent = true, desc = 'Clear search highlight'})

-- Pressing an 'enter visual mode' key while in visual mode changes mode.
map('v', "<C-V>", [[<ESC>`<<C-v>`>]])
map('v', 'V', [[<ESC>`<V`>]])
map('v', 'v', [[<ESC>`<v`>]])

-- Remove the ^M when the encoding gets messed up
map({'n', 'v', 'o'}, "<leader>M", [[mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm]], {desc = 'Clear ^M from wrong encoding'})

-- Allows you to stay in visual mode when indenting with < and >
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Useful in long wrapped lines
map('n', "<C-down>", 'gj', { desc = 'Move down in a wrapped line'})
map('n', "<C-up>", 'gk', { desc = 'Move up in a wrapped line'})

-- Tag movement
map('n', "<C-]>", 'g<C-]>')
map('n', "<C-g>", 'g<C-g>')

-- Quickfix
map({'n', 'v', 'o'}, "<leader>cc", [[:cclose<bar>lclose<CR>]], {desc = 'Close Quikckfix'})
cmd.source(stdconfig .. "/qfclose.vim")

-- Circular window navigation
map('n', "<tab>", "<C-w>w", { desc = 'Clockwise window'})
map('n', "<S-tab>", "<C-w>W", { desc = 'Counter-clockwise window'})

-- Tab configuration
map('n', "<leader>tn", ":tabnew %<CR>", { desc = 'New tab'})
map('n', "<leader>te", ":tabedit", { desc = 'Edit tab'})
map('n', "<leader>tc", ":tabclose<CR>", { desc = 'Close tab'})
map('n', "<leader>tm", ":tabmove", { desc = 'Move tab'})

-- F2 -> Toggle list
map({'n', 'v', 'o'}, "<F2>", [[:set list!<CR>:set list?<CR>]], {desc = 'Toggle list'})
map('i', "<F2>", [[<C-o>:set list!<CR><C-O>:set list?<CR>]], {desc = 'Toggle list'})

-- Spelling
cmd.source(stdconfig .. "/myspelllang.vim")
map({'n', 'v', 'o'}, "<F4>", [[:setlocal spell!<CR>]], {silent = true, desc = 'Toggle spell'})
map('i', "<F4>", [[<C-o>:setlocal spell!<CR>]], {silent = true, desc = 'Toggle spell'})
map({'n', 'v', 'o'}, "<C-F4>", [[:call NViMySpellLang()<CR>]], {silent = true, desc = 'Rotate spelling language'})
map('i', "<C-F4>", [[<C-o>:call NViMySpellLang()<CR>]], {silent = true, desc = 'Rotate spelling language'})

-- <leader>syn -> show syntax group under cursor
cmd.source(stdconfig .. "/syntaxitem.vim")
map({'n', 'v', 'o'}, "<Leader>syn", [[:echo NViSyntaxItem()<CR>]], {silent = true, desc = 'Show syntax group under cursor'})

