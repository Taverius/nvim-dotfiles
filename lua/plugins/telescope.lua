--   vi: tw=100
-- lua/plugins/telescope.lua @ Leonardo Valeri Manera 2022

-- Telescope
require('telescope').setup {}

-- FZF Native
if vim.fn.executable('cmake') == 1 then
    require('telescope').setup {
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                -- the default case_mode is "smart_case"
            }
        }
    }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')
end

-- Telescope-Tabs
require'telescope-tabs'.setup{}

-- Telescope Recent Files
require("telescope").load_extension("recent_files")

-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
require("telescope").load_extension("file_browser")

-- Vim-Bookmarks extension
require('telescope').load_extension('vim_bookmarks')

