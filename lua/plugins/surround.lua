--   vi: tw=100
-- lua/plugins/surround.lua @ Leonardo Valeri Manera 2022

local map = vim.keymap.set
local opt = function(description)
    return { remap = true, silent = true, desc = description }
end

-- No default mappings, as Visual-mode S conflicts with Leap
vim.g.surround_no_mappings = true

-- Custom mappings
-- Normal-mode
map('n', 'ds', "<Plug>Dsurround", opt("Delete surround") )
map('n', 'cs', "<Plug>Csurround", opt("Change surround") )
map('n', 'cS', "<Plug>CSurround", opt("Change surround (own line)") )
map('n', 'ys', "<Plug>Ysurround", opt("Add surround") )
map('n', 'yS', "<Plug>YSurround", opt("Add surround (own line)") )
map('n', 'ySs', "<Plug>Yssurround", opt("Add surround lines") )
map('n', 'ySS', "<Plug>YSsurround", opt("Add surround lines") )
-- Visual-mode
map('x', 'yS', "<Plug>VSurround", opt("Add surround") )
map('x', 'gS', "<Plug>VgSurround", opt("Add surround (virtual)") )
-- Insert-mode
map('i', '<C-G>s', "<Plug>Isurround", opt("Insert surround") )
map('i', '<C-G>S', "<Plug>ISurround", opt("Insert surround") )

