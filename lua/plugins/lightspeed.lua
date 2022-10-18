--   vi: tw=100
-- lua/plugins/lightspeed.lua @ Leonardo Valeri Manera 2022

require('lightspeed').setup {
    match_only_the_start_of_same_char_seqs = true,
}

-- Which-keu
require("which-key").register({
    s = { name = "Search forward", mode = 'nv' },
    S = { name = "Search backward", mode = 'nv' },
    z = { name = "Select until forward", mode = 'o' },
    Z = { name = "Select until backward", mode = 'o' },
    x = { name = "Select including forward", mode = 'o' },
    X = { name = "Search including backward", mode = 'o' },
    gs = { name = "Search in next windows", mode = 'n' },
    gS = { name = "Search in previous windows", mode = 'n' },
    f = { name = "Search forward including", mode = 'nvo' },
    F = { name = "Search backward including", mode = 'nvo' },
    t = { name = "Search forward until", mode = 'nvo' },
    T = { name = "Search backward until", mode = 'nvo' },
    })


