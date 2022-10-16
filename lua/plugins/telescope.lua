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
map('n', "<leader>lp", builtin.pickers, { desc = "Telescope pickers" })
-- <leader>lgb -> Grep in current buffer
map('n', "<leader>lgb", builtin.current_buffer_fuzzy_find, { desc = "Telescope Grep in buffer" })
-- <leader>lgd -> Grep in current directory
map('n', "<leader>lgd", builtin.live_grep, { desc = "Telescope Grep in CWD" })
-- <leader>lb -> Search buffers
map('n', "<leader>lb", builtin.buffers, { desc = "Telescope buffers" })
-- <leader>lff -> Find files
map('n', "<leader>lff", builtin.find_files, { desc = "Telescope files in CWD" })
-- <leader>lfb -> File browser
map('n', "<leader>lfb", require("telescope").extensions.file_browser.file_browser, { desc = "Telescope file browser" })
-- <leader>lta -> Search Tags in all buffers
map('n', "<leader>lta", builtin.tags, { desc = "Telescope all Tags" })
-- <leader>ltb -> Search Tags in current buffer
map('n', "<leader>ltb", builtin.current_buffer_tags, { desc = "Telescope buffer Tags" })
-- <leader>lto -> Search Tags in outline
map('n', "<leader>lto", require("telescope").extensions.ctags_outline.outline, { desc = "Telescope outline Tags" })
-- <leader>lma -> Search Marks in all buffers
map('n', "<leader>lma", require("telescope").extensions.vim_bookmarks.all, { desc = "Telescope all Marks" })
-- <leader>lmc -> Search Marks in current buffer
map('n', "<leader>lmc", require("telescope").extensions.vim_bookmarks.current_file, { desc = "Telescope buffer Marks" })
-- <leader>lhy -> Search the Yank Ring
map('n', "<leader>lhy", ":Telescope yank_history", { silent = true, desc = "Telescope Yank history" })
-- <leader>lhs -> Search search history
map('n', "<leader>lhs", builtin.search_history, { desc = "Telescope Search history" })
-- <leader>lhc -> Search command history
map('n', "<leader>lhc", builtin.command_history, { desc = "Telescope Command history" })
-- <leader>lr -> Search MRU
map('n', "<leader>lr", require("telescope").extensions.recent_files.pick, { desc = "Telescope MRU" })
-- <leader>ltt -> Search for tabs
map('n', "<leader>ltt", require('telescope-tabs').list_tabs, { desc = "Telescope Tabs" })

