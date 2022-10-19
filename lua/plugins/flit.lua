--   vi: tw=100
-- lua/plugins/flit.lua @ Leonardo Valeri Manera 2022

require("flit").setup {}

-- Which-key/Legendary registrations
-- Normal-mode maps
require("which-key").register({
    ["f"] = "Search forward including",
    ["F"] = "Search backward including",
    ["t"] = "Search forward until",
    ["T"] = "Search backward until",
    }, { mode = 'n' })
-- Visual-mode maps
require("which-key").register({
    ["f"] = "Search forward including",
    ["F"] = "Search backward including",
    ["t"] = "Search forward until",
    ["T"] = "Search backward until",
    }, { mode = 'v' })
-- Operator-mode maps
require("which-key").register({
    ["f"] = "Search forward including",
    ["F"] = "Search backward including",
    ["t"] = "Search forward until",
    ["T"] = "Search backward until",
    }, { mode = 'o' })

