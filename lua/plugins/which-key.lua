--   vi: tw=100
-- lua/plugins/which-key.lua @ Leonardo Valeri Manera 2022

require("which-key").setup {}

-- Non-plugin (and legendary) keymaps
require("which-key").add({
    { "<leader>,", hidden = true },
    { "<leader>=", group = "Utility" },
    { "<leader>c", group = "Quickfix" },
    { "<leader>t", group = "Tabs" },
    { "<leader>h", group = "Legendary"},
})

-- Legendary
require("which-key").add({
    { "<leader>hk", group = "Keymaps" },
})
