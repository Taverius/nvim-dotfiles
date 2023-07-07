--   vi: tw=100
-- lua/plugins/init.lua @ Leonardo Valeri Manera 2023

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
    },

    -- Vim-Matchup
    "andymass/vim-matchup",

    -- Dressing
    "stevearc/dressing.nvim",

    -- Notify
    "rcarriga/nvim-notify",

    -- Plenary
    "nvim-lua/plenary.nvim",

    -- DevIcons
    "kyazdani42/nvim-web-devicons",

    -- Dashboard
    "goolord/alpha-nvim",

    -- Auto-Save
    "Pocco81/auto-save.nvim",

    -- FZF
    {
        "junegunn/fzf",
        cond = vim.fn.executable("fzf"),
    },

    -- Repeat
    "tpope/vim-repeat",
    {
        "inkarkat/vim-visualrepeat",
        dependencies = {
            "inkarkat/vim-ingo-library",
        },
    },

    -- Echodoc
    "Shougo/echodoc.vim",

    -- Bookmarks
    "MattesGroeger/vim-bookmarks",

    -- Fuzzy
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        cond = vim.fn.executable("cmake")
            or (not vim.fn.has("windows")) and vim.fn.executable("make")
            or false,
        build = vim.fn.executable("cmake") and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
            or (not vim.fn.has("windows")) and vim.fn.executable("make") and "make"
            or nil,
    },
    {
        "tzachar/fuzzy.nvim",
        module = true,
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
        }
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
            "LukasPietzschmann/telescope-tabs",
            "smartpde/telescope-recent-files",
            "nvim-telescope/telescope-file-browser.nvim",
            "fcying/telescope-ctags-outline.nvim",
            {
                "kelly-lin/telescope-ag",
                cond = vim.fn.executable("ag"),
            },
            "tom-anders/telescope-vim-bookmarks.nvim",
        },
    },

    -- Bindings Help
    "folke/which-key.nvim",
    "mrjones2014/legendary.nvim",

    -- UndoTree
    "jiaoshijie/undotree",

    -- Buffer Stuff
    "artnez/vim-wipeout",
    "smitajit/bufutils.vim",

    -- Fern
    {
        "lambdalisue/fern.vim",
        dependencies = {
            "lambdalisue/fern-git-status.vim",
            "lambdalisue/nerdfont.vim",
            "lambdalisue/fern-renderer-nerdfont.vim",
            "lambdalisue/glyph-palette.vim",
            "lambdalisue/fern-hijack.vim",
            "yuki-yano/fern-preview.vim",
        },
    },

    -- The artist formerly known as the artist formerly known as vim-easyclip
    "gbprod/cutlass.nvim",
    "gbprod/yanky.nvim",

    -- Gutentags
    "ludovicchabant/vim-gutentags",

    -- VSnip
    {
        "hrsh7th/vim-vsnip",
        dependencies = { "rafamadriz/friendly-snippets", },
    },

    -- CMP
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-buffer",
            "amarakon/nvim-cmp-buffer-lines",
            "FelipeLema/cmp-async-path",
            {
                "petertriho/cmp-git",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
            },
            "hrsh7th/cmp-cmdline",
            "dmitmel/cmp-cmdline-history",
            {
                "tzachar/cmp-fuzzy-buffer",
                dependencies = {
                    "tzachar/fuzzy.nvim",
                },
            },
            {
                "tzachar/cmp-fuzzy-path",
                cond = vim.fn.executable("fd"),
                dependencies = {
                    "tzachar/fuzzy.nvim",
                },
            },
            {
                "quangnguyen30192/cmp-nvim-tags",
                dependencies = {
                    "ludovicchabant/vim-gutentags",
                },
            },
            "hrsh7th/cmp-nvim-lua",
            "ray-x/cmp-treesitter",
            "hrsh7th/cmp-omni",
        },
    },

    -- Statusline
    "nvim-lualine/lualine.nvim",

    -- Bufferline
    "kdheepak/tabline.nvim",

    -- Motions
    "ggandor/lightspeed.nvim",
    "ggandor/leap.nvim",
    "ggandor/flit.nvim",
    "haya14busa/vim-asterisk",
    "haya14busa/is.vim",

    -- Misc
    { "echasnovski/mini.nvim", version = "*" },
    "AndrewRadev/splitjoin.vim",
    "jeffkreeftmeijer/vim-numbertoggle",
    "junegunn/vim-pseudocl",
    "junegunn/vim-easy-align",
    "junegunn/vim-peekaboo",
    "matze/vim-move",
    "mhinz/vim-signify",
    "tpope/vim-abolish",
    "tpope/vim-surround",
    "tpope/vim-fugitive",
    "tpope/vim-characterize",
    "tpope/vim-unimpaired",
    "numToStr/Comment.nvim",
    "gbprod/stay-in-place.nvim",

    -- VimRegEx helper
    "Raimondi/VimRegEx.vim",

    -- Filetypes
    "sheerun/vim-polyglot",
    "k-takata/vim-nsis",
    { "Taverius/starsector-ft.vim", dev = false },

    -- Colorschemes
    "projekt0n/github-nvim-theme",
    "rktjmp/lush.nvim",
    "ellisonleao/gruvbox.nvim",
    "savq/melange",
    "olimorris/onedark.nvim",
    "casonadams/walh",
    {
        "catppuccin/nvim",
        name = "catppuccin"
    },
    "mrjones2014/lighthaus.nvim",

},
{
    -- Options
    dev = {
        -- where the dev plugin path is
        path = vim.fn.stdpath("data") .. "/dev",
    },
    checker = {
            -- check for updates automatically
            enabled = true,
            -- don't notify, we use lualine for this
            notify = false,
            -- check once a day
            frequence = 86400,
        }
})

