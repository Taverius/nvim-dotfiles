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
-- Legendary
require("legendary").bind_keymaps({
    { 's', description = "Search forward", mode = { 'n', 'v' } },
    { 'S', description = "Search backward", mode = { 'n', 'v' } },
    { 'z', description = "Select until forward", mode = { 'o' } },
    { 'Z', description = "Select until backward", mode = { 'o' } },
    { 'x', description = "Select including forward", mode = { 'o' } },
    { 'X', description = "Search including backward", mode = { 'o' } },
    { 'gs', description = "Search in next windows", mode = { 'n' } },
    { 'gS', description = "Search in previous windows", mode = { 'n' } },
    { 'f', description = "Search forward including", mode = { 'n', 'v', 'o' } },
    { 'F', description = "Search backward including", mode = { 'n', 'v', 'o' } },
    { 't', description = "Search forward until", mode = { 'n', 'v', 'o' } },
    { 'T', description = "Search backward until", mode = { 'n', 'v', 'o' } },
})
