--   vi: tw=100
-- lua/plugins/nvim-treesitter.lua @ Leonardo Valeri Manera 2022

require('nvim-treesitter.configs').setup {
    ensure_installed = {
        "bash",
        "cmake",
        "comment",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "elvish",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "ini",
        "json",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "nix",
        "passwd",
        "regex",
        "ssh_config",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    matchup = {
        enable = true,
    },
}

require('ts_context_commentstring').setup {
  enable_autocmd = false,
}

-- Treestitter-based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

