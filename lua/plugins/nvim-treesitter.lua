--   vi: tw=100
-- lua/plugins/nvim-treesitter.lua @ Leonardo Valeri Manera 2022

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash",
        "cmake",
        "comment",
        "css",
        "gitattributes",
        "help",
        "html",
        "json",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "toml",
        "vim",
        "yaml",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
    matchup = {
        enable = true,
    },
}

-- Treestitter-based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

