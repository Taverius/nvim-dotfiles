--   vi: tw=100
-- lua/plugins/nvim-cmp.lua @ Leonardo Valeri Manera 2023

-- SuperTab behaviour helpers
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Set up nvim-cmp.
local cmp = require("cmp")

-- Compare functions
local cmp_buffer = require('cmp_buffer')
local compare = require("cmp.config.compare")

cmp.setup({
    -- We need a snippet engine for cmp
    -- Might as well be vsnip
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),

        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping({
            i = function(fallback)
                if cmp.visible() and cmp.get_active_entry() then
                    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                else
                    fallback()
                end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
        }),
    }),
    sorting = {
        comparators = {
            require("cmp_fuzzy_buffer.compare"),
            function(...) return cmp_buffer:compare_locality(...) end,
            compare.offset,
            compare.exact,
            compare.score,
            compare.recently_used,
            compare.locality,
            compare.kind,
            compare.length,
            compare.order,
        }
    },
    sources = cmp.config.sources({
        { name = "vsnip" },
        { name = "treesitter" },
        { name = "fuzzy_buffer" },
        { name = "fuzzy_path"},
        { name = "nvim_lua" },
    }, {
        { name = "buffer" },
        { name = "async_path" },
        { name = 'omni' }
    }),
})

-- Setup `/` and `?`
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        {
            name = "buffer",
            option = { keyword_pattern = [[\k\+]] }
        },
        { name = "buffer-lines" },
        { name = "cmdline_history" },
    }
})

-- Setup ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "fuzzy_path"},
        { name = "async_path" },
    }, {
        {
            name = "cmdline",
            option = {
                ignore_cmds = { "Man", "!" }
            }
        },
        { name = "cmdline_history" },
    })
})

-- Setup '@'
cmp.setup.cmdline('@', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "cmdline_history" },
    }
})

-- Git completion.
cmp.setup.filetype({ 'gitcommit', 'octo' }, {
    sources = cmp.config.sources({
        { name = "git" },
        { name = "fuzzy_buffer" },
    }, {
        { name = "buffer" },
    })
})
require("cmp_git").setup()

