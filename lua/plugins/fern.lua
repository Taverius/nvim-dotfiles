--   vi: tw=100
-- lua/plugins/fern.lua @ Leonardo Valeri Manera 2022

local g = vim.g
local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local init_fern = function()
    -- NERDTree-like mappings
    map('n', 'o', "<Plug>(fern-action-open:edit)", { buffer = true, remap = true })
    map('n', 'go', "<Plug>(fern-action-open:edit)<C-w>p", { buffer = true, remap = true })
    map('n', 't', "<Plug>(fern-action-open:tabedit)", { buffer = true, remap = true })
    map('n', 'T', "<Plug>(fern-action-open:tabedit)gT", { buffer = true, remap = true })
    map('n', 'i', "<Plug>(fern-action-open:split)", { buffer = true, remap = true })
    map('n', 'gi', "<Plug>(fern-action-open:split)<C-w>p", { buffer = true, remap = true })
    map('n', 's', "<Plug>(fern-action-open:vsplit)", { buffer = true, remap = true })
    map('n', 'gs', "<Plug>(fern-action-open:vsplit)<C-w>p", { buffer = true, remap = true })
    map('n', 'ma', "<Plug>(fern-action-new-path)", { buffer = true, remap = true })
    map('n', 'P', "gg", { buffer = true, remap = true })

    map('n', 'C', "<Plug>(fern-action-enter)", { buffer = true, remap = true })
    map('n', 'u', "<Plug>(fern-action-leave)", { buffer = true, remap = true })
    map('n', 'r', "<Plug>(fern-action-reload)", { buffer = true, remap = true })
    map('n', 'R', "gg<Plug>(fern-action-reload)<C-o>", { buffer = true, remap = true })
    map('n', 'cd', "<Plug>(fern-action-cd)", { buffer = true, remap = true })
    map('n', 'CD', "gg<Plug>(fern-action-cd)<C-o>", { buffer = true, remap = true })

    map('n', 'I', "<Plug>(fern-action-hidden-toggle)", { buffer = true, remap = true })

    -- Smart preview
    map('n', '<Plug>(fern-quit-or-close-preview)',
        [[fern_preview#smart_preview("\<Plug>(fern-action-preview:close)", ":q\<CR>")]],
        { buffer = true, remap = true, silent = true, expr = true })
    map('n', 'q', "<Plug>(fern-quit-or-close-preview)", { buffer = true, remap = true, silent = true })
end

local nviFernInit = augroup("nviFernInit", {})
-- Call the init function when Fern starts
autocmd("FileType", {
    group = nviFernInit,
    pattern = "fern",
    callback = init_fern
})
-- Colorize NERDFont glyphs
autocmd("FileType", {
    group = nviFernInit,
    pattern = "fern",
    command = "call glyph_palette#apply()"
})

g['fern#renderer'] = "nerdfont"

