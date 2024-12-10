--   vi: tw=100
-- lua/plugins/init.lua @ Leonardo Valeri Manera 2023

local opt = vim.opt
local fn = vim.fn

-- Bootstrap lazy.nvim
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    fn.getchar()
    os.exit(1)
  end
end
opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },

    -- Vim-Matchup
    "andymass/vim-matchup",

    -- Surround
    {
        "kylechui/nvim-surround",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
    },

    -- Dressing
    "stevearc/dressing.nvim",

    -- Notify
    "rcarriga/nvim-notify",

    -- Plenary
    "nvim-lua/plenary.nvim",

    -- DevIcons
    "kyazdani42/nvim-web-devicons",

    -- Auto-Save
    {
        "okuuva/auto-save.nvim",
        version = '^1.0.0',
        cmd = "ASToggle",
        event = { "InsertLeave", "TextChanged" },
    },

    -- FZF
    {
        "junegunn/fzf",
        cond = fn.executable("fzf"),
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
        cond = fn.executable("cmake")
            or (not fn.has("windows")) and fn.executable("make")
            or false,
        build = fn.executable("cmake") and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
            or (not fn.has("windows")) and fn.executable("make") and "make"
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
                cond = fn.executable("ag"),
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
    {
        "ggandor/lightspeed.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
        cond = false,
    },
    {
        "ggandor/leap.nvim",
        dependencies = {
            "tpope/vim-repeat",
        },
    },
    {
        "ggandor/flit.nvim",
        dependencies = {
            "tpope/vim-repeat",
            "ggandor/leap.nvim",
        },
    },
    "haya14busa/vim-asterisk",
    {
        "haya14busa/is.vim",
        dependencies = {
            "haya14busa/vim-asterisk",
        },
    },

    -- Misc
    { "echasnovski/mini.nvim", version = false },
    "jeffkreeftmeijer/vim-numbertoggle",
    "junegunn/vim-pseudocl",
    "junegunn/vim-peekaboo",
    "mhinz/vim-signify",
    "tpope/vim-abolish",
    "tpope/vim-fugitive",
    "tpope/vim-characterize",
    "gbprod/stay-in-place.nvim",
    "equalsraf/neovim-gui-shim",

    -- VimRegEx helper
    "Raimondi/VimRegEx.vim",

    -- Filetypes
    "sheerun/vim-polyglot",
    "k-takata/vim-nsis",
    "cmcaine/vim-uci",
    "elkasztano/nushell-syntax-vim",
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
        path = fn.stdpath("data") .. "/dev",
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

