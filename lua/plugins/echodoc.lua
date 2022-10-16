--   vi: tw=100
-- lua/plugins/echodoc.lua @ Leonardo Valeri Manera 2022

local g = vim.g
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

g['echodoc#enable_at_startup'] = 1
g['echodoc#type'] = 'floating'

local nviEchodocHighlight = augroup("nviEchodocHighlight", {})
autocmd("ColorScheme", {
    group = nviEchodocHighlight,
    command = "highlight clear EchoDocPopup",
})
autocmd("ColorScheme", {
    group = nviEchodocHighlight,
    command = "highlight! link EchoDocPopup Pmenu",
})

