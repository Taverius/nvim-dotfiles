--   vi: tw=100
-- lua/plugins/nvim-treesitter.lua @ Leonardo Valeri Manera 2022

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash",
        "comment",
        "diff",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
        "vimdoc",
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

