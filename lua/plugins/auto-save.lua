--   vi: tw=100
-- lua/plugins/auto-save.lua @ Leonardo Valeri Manera 2022

require("auto-save").setup {
    trigger_events = { "InsertLeave", "TextChanged", "FocusLost"}
}

