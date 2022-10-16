--   vi: tw=100
-- lua/plugins/undotree.lua @ Leonardo Valeri Manera 2022

local undotree = require('undotree')

-- Options
undotree.setup({
  float_diff = true,  -- using float window previews diff, set this `true` will disable layout option
  layout = "left_bottom", -- "left_bottom", "left_left_bottom"
  -- ignore_filetype = { 'Undotree', 'UndotreeDiff', 'qf', 'TelescopePrompt', 'spectre_panel', 'tsplayground' },
})

-- <leader>u -> Undo
vim.keymap.set('n', "<leader>u", undotree.toggle, {silent = true, desc = "Undotree toggle" })

