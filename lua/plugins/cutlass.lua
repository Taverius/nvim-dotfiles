--   vi: tw=100
-- lua/plugins/cutlass.lua @ Leonardo Valeri Manera 2022

require("cutlass").setup({
        cut_key = 'm',          -- m is our yank-and-delete key
        override_del = true,    -- Also override <DEL>
        exclude = {
        "ns", "nS"              -- Don't affect s so that sneak/lightspeed can work
    },
  })

-- The above masks m (create mark) so map that to gm
vim.keymap.set('n', "gm", "m")

