--   vi: tw=100
-- lua/colorscheme.lua @ Leonardo Valeri Manera 2022

-- github_dimmed
require("github-theme").setup({ theme_style = "dimmed", })
-- gruvbox
require("gruvbox").setup({ contrast = "soft", })
-- melange
-- onedarkpro
require("onedarkpro").setup({ dark_theme = "onedark", })
-- catpuccin
vim.g.catppuccin_flavour = "frappe"
-- lighthaus

vim.cmd.colorscheme('melange')

