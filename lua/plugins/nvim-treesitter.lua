--   vi: tw=100
-- lua/nvim-treesitter.lua @ Leonardo Valeri Manera 2022

require('nvim-treesitter.configs').setup {
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

