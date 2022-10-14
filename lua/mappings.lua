--   vi: tw=100
-- lua/mappings.lua @ Leonardo Valeri Manera 2022

local opt = vim.opt
local opt_local = vim.opt_local
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- , is mapleader, so rebind ,, to ,
map({ 'n', 'v' }, ',,', ',', { silent = true })

-- bind ; to :, and ;; to ;
map({ 'n', 'v' }, ';;', ';', { silent = true })
map({ 'n', 'v' }, ';', ':')
map({ 'n', 'v' }, '<M-;>', ';')
map({ 'n', 'v' }, 'q;', 'q:')

-- CTRL-Space toggles folds
map({ 'n', 'v', 'o' }, "<C-Space>",
    [[@=(foldlevel('.')?'za':'l')<CR>]],
    { silent = true, desc = 'Toggle fold under cursor' })
map('i', "<C-Space>",
    [[<C-o>@=(foldlevel('.')?'za':'l')<CR>]],
    { silent = true, desc = 'Toggle fold under cursor' })

-- Let Control-S be 'save' as it is in most other editors
map({ 'n', 'v', 'o', 'i' }, "<C-s>", function() cmd.w() end)

-- Map Crlt-C directly to ESC
map('i', "<C-c>", "<ESC>")

-- qq to record, Q to replay
map('n', 'Q', "@q", { desc = 'Replay macro' })

-- Shift-Enter -> ESC
map({ 'n', 'v', 'o' }, "<S-CR>", "<Esc>")

-- \ clears the search pattern
map('n', [[\]], ":noh<CR>",
    { silent = true, desc = 'Clear search highlight' })

-- Pressing an 'enter visual mode' key while in visual mode changes mode.
map('v', "<C-V>", [[<ESC>`<<C-v>`>]])
map('v', 'V', [[<ESC>`<V`>]])
map('v', 'v', [[<ESC>`<v`>]])

-- Remove the ^M when the encoding gets messed up
map({ 'n', 'v', 'o' }, "<leader>M",
    [[mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm]],
    { desc = 'Clear ^M from wrong encoding' })

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
map({ 'n', 'v', 'o' }, "<leader>cc", [[:cclose<bar>lclose<CR>]], { desc = 'Close Quikckfix' })
local nviQfClose = augroup("nviQfClose", {})
autocmd("FileType", {
        group = nviQfClose,
        pattern = "qf",
        callback = function()
            if vim.api.nvim_eval("mapcheck('<esc>', 'n') ==# ''") then
                map('n', "<esc>", [[:cclose<bar>lclose<CR>]], {
                    buffer = true, silent = true, desc = 'Close Quikckfix' })
            end
        end
    })

-- Circular window navigation
map('n', "<tab>", "<C-w>w", { desc = 'Clockwise window' })
map('n', "<S-tab>", "<C-w>W", { desc = 'Counter-clockwise window' })

-- Tab configuration
map('n', "<leader>tn", ":tabnew %<CR>", { desc = 'New tab' })
map('n', "<leader>te", ":tabedit", { desc = 'Edit tab' })
map('n', "<leader>tc", ":tabclose<CR>", { desc = 'Close tab' })
map('n', "<leader>tm", ":tabmove", { desc = 'Move tab' })

-- F2 -> Toggle list
map({ 'n', 'v', 'o', 'i' }, "<F2>",
    function()
        cmd.set("list!")
        print(cmd.set("list?"))
    end,
    {desc = 'Toggle list'})

-- Spelling
g.my_lang_codes = { 'en_gb', 'it', 'en_gb,it' }
if g.MY_LANG_IDX == nil or g.MY_LANG_IDX + 1 < vim.tbl_count(g.my_lang_codes) then
    g.MY_LANG_IDX = 0
end

map({ 'n', 'v', 'o', 'i' }, "<F4>",
    function()
        cmd.setlocal("spell!")
        print(cmd.setlocal("spell?"))
    end,
    { desc = 'Toggle spell' })
map({ 'n', 'v', 'o', 'i' }, "<C-F4>",
    function()
        opt_local.spelllang = fn.get(g.my_lang_codes, g.MY_LANG_IDX)
        g.MY_LANG_IDX = ( g.MY_LANG_IDX + 1 < vim.tbl_count(g.my_lang_codes) ) and g.MY_LANG_IDX + 1 or 0
        print(vim.o.spelllang)
    end,
    { desc = 'Change spelling language' })

-- <leader>syn -> show syntax group under cursor
map({ 'n', 'v', 'o' }, "<Leader>syn",
    function()
        print(vim.api.nvim_eval([[join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')]]))
    end,
    { desc = 'Show syntax group under cursor' })

