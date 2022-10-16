--   vi: tw=100
-- lua/plugins/telescope.lua @ Leonardo Valeri Manera 2022

local map = vim.keymap.set

-- Telescope
local setup = require('telescope').setup
local extension = require('telescope').load_extension
local builtin = require('telescope.builtin')
setup {}

-- FZF Native
if vim.fn.executable('cmake') == 1 then
    setup {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
            }
        }
    }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    extension("fzf")
end

-- Telescope-Tabs
require('telescope-tabs').setup{}

-- Telescope Recent Files
extension("recent_files")

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
extension("file_browser")

-- Vim-Bookmarks extension
extension("vim_bookmarks")

-- Ctags
if vim.fn.executable(vim.g.ctags_location) then
    extension("ctags_outline")
end

-- Ag
if vim.fn.executable('ag') then
    extension("ag")
end

-- Coq
if vim.fn.has('python3') then
    extension("coc")
end

