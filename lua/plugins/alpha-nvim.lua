--   vi: tw=100
-- lua/plugins/alpha-nvim.lua @ Leonardo Valeri Manera 2022

local home = vim.env.HOME

local alpha = require('alpha')
local theme = require('alpha.themes.theta')
local dashboard = require("alpha.themes.dashboard")

theme.header.val = {
[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]]
}

theme.buttons.val = {
        { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("e", "  New file", "<cmd>ene<CR>"),
        dashboard.button("<leader> l f b", "  File browser"),
        dashboard.button("<leader> l g d", "  Live grep"),
        dashboard.button("c", "  Configuration", "<cmd>cd " .. vim.fn.stdpath('config') .. " <CR>"),
        dashboard.button("u", "  Update plugins", "<cmd>PlugUpdate<CR>"),
        dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

alpha.setup(theme.config)

