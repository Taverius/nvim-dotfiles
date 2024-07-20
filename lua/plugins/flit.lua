--   vi: tw=100
-- lua/plugins/flit.lua @ Leonardo Valeri Manera 2022

require("flit").setup {}

-- Which-key/Legendary registrations
-- Normal-mode maps
require("which-key").add({
    { "f", desc = "Search forward including" },
    { "F", desc = "Search backward including" },
    { "t", desc = "Search forward until" },
    { "T", desc = "Search backward until" },
})
-- Visual-mode maps
require("which-key").add({
    {
      mode = { "v" },
      { "f", desc = "Search forward including" },
      { "F", desc = "Search backward including" },
      { "t", desc = "Search forward until" },
      { "T", desc = "Search backward until" },
    },
})
-- Operator-mode maps
require("which-key").add({
    {
      mode = { "o" },
      { "f", desc = "Search forward including" },
      { "F", desc = "Search backward including" },
      { "t", desc = "Search forward until" },
      { "T", desc = "Search backward until" },
    },
})

