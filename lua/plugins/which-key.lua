--   vi: tw=100
-- lua/plugins/which-key.lua @ Leonardo Valeri Manera 2022

require("which-key").setup {
    plugins = {
        spelling = {
            enabled = true
        }
    }
}

-- Non-plugin (and legendary) keymaps
require("which-key").register({
    c = { name = "Quickfix" },
    t = { name = "Tabs" },
    ["="] = { name = "Utility" },
    h = { name = "Legendary" },
    [","] = "which_key_ignore",
    },
    { prefix = "<leader>" })

-- Legendary
require("which-key").register({
    k = { name = "Keymaps" },
    },
    { prefix = "<leader>h" })

-- Splitjoin
require("which-key").register({
    ["gS"] = { "Split code block" },
    ["gJ"] = { "Join code block"}
    })

