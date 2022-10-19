--   vi: tw=100
-- init.lua @ Leonardo Valeri Manera 2022

local source = function(file)
    vim.cmd.source(vim.fn.stdpath('config') .. "/vim/" .. string.gsub(file, "%.", "/") .. ".vim")
end

-- vim-plug #plug setup
source("plugins")

-- general setup
require("settings")
require("mappings")
require("colorscheme")

-- plugin configurations
vim.cmd("packadd! starsector-ft.vim")
vim.cmd("packadd! my-gutentags")
-- Which-key and Legendary go first so they can be used in all plugins to register maps
require("plugins.legendary")
require("plugins.which-key")
require("plugins.vim-plug")
require("plugins.nvim-treesitter")
require("plugins.vim-matchup")
require("plugins.alpha-nvim")
require("plugins.auto-save")
require("plugins.echodoc")
require("plugins.telescope")
require("plugins.vim-bookmarks")
require("plugins.undotree")
require("plugins.vim-wipeout")
require("plugins.bufutils")
require("plugins.fern")
require("plugins.cutlass")
require("plugins.yanky")
source("plugins.asyncomplete")
require("plugins.coq")
require("plugins.gutentags")
require("plugins.lualine")
require("plugins.tabline")
require("plugins.lightspeed")
require("plugins.is")
require("plugins.splitjoin")
require("plugins.vim-numbertoggle")
require("plugins.vim-easy-align")
source("plugins.vim-easy-align")
require("plugins.characterize")
require("plugins.comment")
require("plugins.stay-in-place")

