--   vi: tw=100
-- lua/plugins/leap.lua @ Leonardo Valeri Manera 2022

require('leap').add_default_mappings()

-- Which-key/Legendary registrations
-- Normal-mode maps
require("which-key").add({
    { "s", desc = "Search forward" },
    { "S", desc = "Search backward" },
    { "gs", desc = "Search in next windows" },
    { "gS", desc = "Search in previous windows" },
})
-- Visual-mode maps
require("which-key").add({
    {
      mode = { "v" },
      { "s", desc = "Search forward" },
      { "S", desc = "Search backward" },
      { "x", desc = "Select until forward" },
      { "X", desc = "Search until backward" },
      { "gs", desc = "Search in next windows" },
      { "gS", desc = "Search in previous windows" },
    },
})
-- Operator-mode maps
require("which-key").add({
    {
      mode = { "o" },
      { "s", desc = "Search forward" },
      { "S", desc = "Search backward" },
      { "x", desc = "Select until forward" },
      { "X", desc = "Search until backward" },
      { "gs", desc = "Search in next windows" },
      { "gS", desc = "Search in previous windows" },
    },
})

