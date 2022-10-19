--   vi: tw=100
-- lua/plugins/lightspeed.lua @ Leonardo Valeri Manera 2022

require('lightspeed').setup {
    match_only_the_start_of_same_char_seqs = true,
}

-- Which-key/Legendary registrations
-- Norma-mode maps
require("which-key").register({
    ["s"] = "Search forward",
    ["S"] = "Search backward",
    ["gs"] = "Search in next windows",
    ["gS"] = "Search in previous windows",
    ["f"] = "Search forward including",
    ["F"] = "Search backward including",
    ["t"] = "Search forward until",
    ["T"] = "Search backward until",
    }, { mode = 'n' })
-- Visual-mode maps
require("which-key").register({
    ["s"] = "Search forward",
    ["S"] = "Search backward",
    ["f"] = "Search forward including",
    ["F"] = "Search backward including",
    ["t"] = "Search forward until",
    ["T"] = "Search backward until",
    }, { mode = 'v' })
-- Operator-mode maps
require("which-key").register({
    ["z"] = "Select until forward",
    ["Z"] = "Select until backward",
    ["x"] = "Select including forward",
    ["X"] = "Search including backward",
    ["f"] = "Search forward including",
    ["F"] = "Search backward including",
    ["t"] = "Search forward until",
    ["T"] = "Search backward until",
    }, { mode = 'o' })

