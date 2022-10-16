--   vi: tw=100
-- lua/plugins/telescope.lua @ Leonardo Valeri Manera 2022

local map = vim.keymap.set

-- Telescope
local setup = require('telescope').setup
local extension = require('telescope').load_extension
local builtin = require('telescope.builtin')

-- FZF Native
if vim.fn.executable('cmake') == 1 or vim.fn.executable('make') == 1 then
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
else
    setup {}
end

-- Telescope-Tabs
require('telescope-tabs').setup {}

-- Telescope Recent Files
extension("recent_files")

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
extension("file_browser")

-- Vim-Bookmarks extension
extension("vim_bookmarks")

-- Ctags outline
extension("ctags_outline")

-- Ag
if vim.fn.executable('ag') then
    extension("ag")
end

-- Tanky
extension("yank_history")

-- binds
-- <leader>lp -> Show list of pickers
map('n', "<leader>lp", builtin.pickers, {})
-- <leader>lg -> Search in current buffer
map('n', "<leader>lg", builtin.current_buffer_fuzzy_find, {})
-- <leader>lb -> Search buffers
map('n', "<leader>lb", builtin.buffers, {})
-- <leader>lf -> File browser
map('n', "<leader>lf", require("telescope").extensions.file_browser.file_browser, {})
-- <leader>lta -> Search for Tags in all buffers
map('n', "<leader>lta", builtin.tags, {})
-- <leader>ltc -> Search for Tags in current buffer
map('n', "<leader>ltc", builtin.current_buffer_tags, {})
-- <leader>lto -> Search for Tags in current buffer
map('n', "<leader>lto", require("telescope").extensions.ctags_outline.outline, {})
-- <leader>lma -> Search for Marks in all buffers
map('n', "<leader>lma", require("telescope").extensions.vim_bookmarks.all, {})
-- <leader>lmc -> Search for Marks in current buffer
map('n', "<leader>lmc", require("telescope").extensions.vim_bookmarks.current_file, {})
-- <leader>lhy -> Search the Yank Ring
map('n', "<leader>lhy", ":Telescope yank_history", { silent = true })
-- <leader>lhs -> Search search history
map('n', "<leader>lhs", builtin.search_history, {})
-- <leader>lhc -> Search command history
map('n', "<leader>lhc", builtin.command_history, {})
-- <leader>lr -> Search MRU
map('n', "<leader>lr", require("telescope").extensions.recent_files.pick, {})
-- <leader>ltt -> Search for tabs
map('n', "<leader>ltt", require('telescope-tabs').list_tabs, {})

