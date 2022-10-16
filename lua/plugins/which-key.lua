--   vi: tw=100
-- lua/plugins/which-key.lua @ Leonardo Valeri Manera 2022

require("which-key").setup {}

-- Non-plugin keymaps
require("which-key").register({
    c = { name = "Quickfix" },
    t = { name = "Tabs" },
    s = { name = "Syntax" },
    h = { name = "Legendary" },
    [","] = "which_key_ignore",
    },
    { prefix = "<leader>" })

require("which-key").register({
    y = { name = "Syntax" },
    },
    { prefix = "<leader>s" })

require("which-key").register({
    k = { name = "Keymaps" },
    },
    { prefix = "<leader>h" })

