--   vi: tw=100
-- init.lua @ Leonardo Valeri Manera 2022

local stdconfig = vim.fn.stdpath('config') .. "/vim"
local source = vim.cmd.source

-- vim-plug #plug setup
source(stdconfig .. "/plugins.vim")

-- general setup
require("settings")
require("mappings")
require("colorscheme")

-- plugin configurations
vim.cmd("packadd! starsector-ft.vim")
vim.cmd("packadd! my-gutentags")
require("plugins.vim-plug")
require("plugins.legendary")
require("plugins.which-key")
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
source(stdconfig .. "/plugins/asyncomplete.vim")
require("plugins.coq")
require("plugins.gutentags")
require("plugins.lualine")
require("plugins.tabline")
require("plugins.is")
require("plugins.splitjoin")
require("plugins.vim-numbertoggle")
source(stdconfig .. "/plugins/vim-easy-align.vim")
require("plugins.characterize")
require("plugins.comment")
require("plugins.stay-in-place")

