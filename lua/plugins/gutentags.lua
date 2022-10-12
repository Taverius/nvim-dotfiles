--   vi: tw=100
-- lua/plugins/gutentags.lua @ Leonardo Valeri Manera 2022

-- cache files in the state directory
vim.g.gutentags_cache_dir = vim.fn.fnamemodify(vim.fn.expand('~/.gutentags'), [[:p:gs?\?/?]])

