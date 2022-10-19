--   vi: tw=100
-- lua/plugins/leap.lua @ Leonardo Valeri Manera 2022

require('leap').add_default_mappings()

-- Which-key/Legendary registrations
-- Normal-mode maps
require("which-key").register({
    ["s"] = "Search forward",
    ["S"] = "Search backward",
    ["gs"] = "Search in next windows",
    ["gS"] = "Search in previous windows",
    }, { mode = 'n' })
-- Visual-mode maps
require("which-key").register({
    ["s"] = "Search forward",
    ["S"] = "Search backward",
    ["x"] = "Select until forward",
    ["X"] = "Search until backward",
    ["gs"] = "Search in next windows",
    ["gS"] = "Search in previous windows",
    }, { mode = 'v' })
-- Operator-mode maps
require("which-key").register({
    ["s"] = "Search forward",
    ["S"] = "Search backward",
    ["x"] = "Select until forward",
    ["X"] = "Search until backward",
    ["gs"] = "Search in next windows",
    ["gS"] = "Search in previous windows",
    }, { mode = 'o' })

