--   vi: tw=100
-- lua/settings.lua @ Leonardo Valeri Manera 2022

local stdconfig = vim.fn.stdpath("config") .. "/vim/settings"
local opt = vim.opt
local g = vim.g
local fn = vim.fn
local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

if fn.has('windows') then
    autocmd("UIEnter", { command = "cd ~", once = true })
end

-- NetRW is naughty
g.loaded = 1
g.loaded_netrwPlugin = 1

g.mapleader = ","                           -- Set the Map Leader early
opt.number = true                           -- Show line numbers
opt.shiftwidth = 4                          -- Indent by 4 spaces
opt.softtabstop = 4                         -- Use 4 spaces instead of tab
opt.shiftround = true                       -- Round indent (<,>) to multiples of 'shiftwidth'
opt.expandtab = true                        -- Convert tabs to spaces
opt.lazyredraw = true                       -- Don't redraw the screen mid-command
opt.visualbell = true                       -- Flash the screen instead of beeping
opt.backspace = "indent,eol,nostop"         -- Backspace like normal apps
opt.confirm = true                          -- Instead of failing because of unsaved changes, raise
                                            -- a dialogue
opt.whichwrap = "b,s,<,>,h,l,~,[,]"         -- Make left & right movements wrap around lines always
opt.showmatch = true                        -- Highlight matching paretheses
opt.matchtime = 2                           -- For 0.2 seconds
opt.matchpairs:append { "<:>" }             -- Add <> to hightlighted matches
opt.showfulltag = true                      -- Show full tags when doing search completion
opt.switchbuf = { "useopen", "usetab" }     -- Allow changing windows/tabs for quickfix/:sb/etc
opt.scrolloff = 5                           -- Try to show at least 5 lines
opt.sidescrolloff = 2                       -- and 2 columns of context when scrolling
opt.smartindent = true                      -- Smart indenting
opt.undolevels = 10000                      -- Many undos
opt.ignorecase = true                       -- Ignore case but infer it from context and turn
opt.infercase = true                        -- it back on when using a capital letter in
opt.smartcase = true                        -- a search
opt.report = 0                              -- : commands always show changed line count
opt.shortmess = "filnrxoOstTIcq"            -- Set abbreviation options for prompts
opt.display:append { "uhex" }               -- Show unprintable characters as <xxx>
opt.formatoptions:append { "1" }            -- If possible, break a line before a 1-letter word
opt.fileformats = { "unix", "dos", "mac" }  -- File type order
opt.autochdir = true                        -- Automatically change CWD
opt.showtabline = 2                         -- Always show tab line
opt.diffopt:append { "vertical" }           -- Vertical diff by default
opt.clipboard = { "unnamed", "unnamedplus" }
                                            -- Clipboard is the + register
                                            -- Yank/Delete also use the * register
opt.mouse = "ar"                            -- Full mouse support and damn the hipsters
opt.mousehide = true                        -- Hide the mouse while typing
                                            -- Should redefine the mouse popup menu to remove the
                                            -- entry for removing the mouse menu
opt.numberwidth = 2                         -- Minimum Number column width is 1 digit + space
opt.breakindent = true                      -- Every wrapped line will continue visually indented
opt.breakindentopt = "sbr"                  -- Show the break character before a wrapped line
opt.updatetime = 100                        -- Faster ASync updates
-- opt.printoptions:append { "syntax:y" }      -- Syntax when printing
opt.virtualedit = { "block", "onemore" }    -- Virtual edit in VBlock mode, and one past the end
opt.completeopt:append { "menuone", "longest" }
                                            -- Also show the menu when there is only one option,
                                            -- and only insert the longest common text
opt.wildmode:prepend { "longest:full" }     -- Complete to longest common string first
opt.shada = { "!", "'1000", "<1000", "f1", "h", "s250" }
                                            -- My Big Fat Shada File
opt.concealcursor = "nc"                    -- Conceal cursor line text also in mormal mode and
                                            -- incsearch
opt.conceallevel = 2                        -- Concealed text is completely hidden unless it has
                                            -- replacement text defined
opt.laststatus = 3                          -- Common status line
opt.showbreak = "…"                         -- Linebreaks and other metatextual characters
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", extends = "…", precedes = "…", nbsp = "=" }
opt.fillchars = { fold = "-" }
opt.foldmethod = "syntax"                   -- Fold with syntax by default
opt.foldlevelstart = 99                     -- Start with all folds open
opt.foldcolumn = "2"                        -- Always display a 2-character fold column
opt.cursorline = true                       -- Always show cursor line
opt.cursorcolumn = true                     -- Always show cursor column
opt.tags:prepend(fn.fnamemodify(fn.stdpath('state'), [[:p:gs?\?/?]]) .. 'tags')
                                            -- Set a default tags file in 'state'
opt.viewoptions:remove { "curdir" }         -- Don't save $CWD in the view file
opt.titlestring = [[%f\]] .. [[%h%m%r%w]]   -- File name & flags
opt.titlestring = opt.titlestring:get() .. [[\ -\ %{substitute(expand(v:progname),\ '\.exe',\ '',\ '')}]]
                                            -- Program name
opt.titlestring = opt.titlestring:get() .. [[\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}]]
                                            -- Working directory

-- Force OSC 52 clipboard provider for TUI SSH sessions
-- autocmd("UIEnter", {
--   callback = function()
--     print("UIEnter Check:")
--     print("GUI Running: " .. (fn.has("gui_running") and "yes" or "no"))
--     print("Clipboard provider: " .. (fn.has("clipboard") and "yes" or "no"))
--     print("g:clipboard is set: " .. (g.clipboard or "no"))
--     print([['clipboard': "]] .. vim.o.clipboard .. [["]])
--     print([[$SSH_TTY: ]] .. (vim.env.SSH_TTY or "nil"))
--     print("\n")
--     if ( vim.env.SSH_TTY ~= nil ) and ( vim.env.SSH_TTY ~= "" ) then
--       g.clipboard = {
--         name = 'OSC 52',
--         copy = {
--           ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--           ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
--         },
--         paste = {
--           ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
--           ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
--         },
--       }
--     end
--   end,
--   once = true
-- })

-- Don't screw up folds when inserting text that might affect folds, until leaving insert mode.
-- Foldmethod is local to the window. Protect against screwing up folding when switching between
-- windows.
local nviFoldInsert = augroup("nviFoldInsert", {})
autocmd("InsertEnter", {
    group = nviFoldInsert,
    callback = function()
        if vim.w.last_fdm == nil then
            vim.w.last_fdm = vim.w.foldmethod
            vim.w.foldmethod = "manual"
        end
    end
})
autocmd({ "InsertLeave", "WinLeave" }, {
    group = nviFoldInsert,
    callback = function()
        if vim.w.last_fdm ~= nil then
            vim.w.foldmethod = vim.w.last_fdm
            vim.w.last_fdm = nil
        end
    end
})

-- Toggle cursor line/column highlight only for the active window
local nviCursorHighlight = augroup("nviCursorHighlight", {})
autocmd("WinLeave", {
    group = nviCursorHighlight,
    callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.cursorcolumn = false
    end
})
autocmd("WinEnter", {
    group = nviCursorHighlight,
    callback = function()
        vim.opt_local.cursorline = true
        vim.opt_local.cursorcolumn = true
    end
})

-- Generic function to check if a buffer is backed by a file
g.skipbuffer_filetypes = { "Undotree" }
local buffer_has_file_check = function()
    if fn.empty(vim.bo.buftype) == 0 then
        -- Special buffer type
        return false
    elseif vim.tbl_count(g.skipbuffer_filetypes) > 0 and vim.tbl_contains(g.skipbuffer_filetypes, vim.bo.filetype) then
        -- Check against filetype list
        return false
    elseif vim.api.nvim_eval("match(expand('%:p'), '[')") >= 0 or vim.api.nvim_eval("match(expand('%:p'), ']')") >= 0 then
        -- Check for [ and ] that would brea other comparisons
        return false
    elseif fn.empty(fn.expand([[%:p:h]])) == 1 then
        -- Check for an empty path
        return false
    elseif fn.filereadable(fn.fnameescape(fn.expand(fn.expand([[%:p]])))) == 0 then
        return false
    else
        return true
    end
end

-- Undo file automation
local nviUndoFile = augroup("nviUndoFile", {})
autocmd({ "BufWritePost", "BufWinEnter" }, {
    group = nviUndoFile,
    pattern = "?*",
    callback = function()
        if buffer_has_file_check() then
            vim.opt_local.undofile = true
        end
    end
})

-- View file automation
g.skipview_files = {}
local buffer_make_view_check = function()
    if buffer_has_file_check() then
        return false
    elseif fn.empty(vim.env.TEMP) == 0 and string.find(fn.expand(fn.expand("%:p:h")), vim.env.TEMP) then
        return false
    elseif fn.empty(vim.env.TMP) == 0 and string.find(fn.expand(fn.expand("%:p:h")), vim.env.TMP) then
        return false
    elseif vim.tbl_count(g.skipview_files) > 0 and vim.tbl_contains(g.skipview_files, fn.expand(fn.expand("%"))) then
        return false
    else
        return true
    end
end
local nviAutoView = augroup("nviAutoView", {})
autocmd({ "BufWritePost", "BufLeave", "WinLeave", "FocusLost" }, {
    group = nviAutoView,
    pattern = "?*",
    callback = function()
        if buffer_make_view_check() then
            cmd("silent! mkview")
        end
    end
})
autocmd("BufWinEnter", {
    group = nviAutoView,
    pattern = "?*",
    callback = function()
        if buffer_make_view_check() then
            cmd("silent! loadview")
        end
    end
})

-- CTags
if fn.has("windows") == 1 then
    if fn.executable("ctags") == 1 then
        g.ctags_location = "ctags"
    else
        g.ctags_location = vim.fn.expand("C:/Dev/Ctags/ctags")
    end
else
    if fn.executable("ctags-universal") == 1 then
        g.ctags_location = "ctags-universal"
    else
        g.ctags_location = "ctags"
    end
end

-- Grep selection
if fn.executable("ag") == 1 then
    -- The Silver Searcher
    opt.grepprg = [[ag\ --vimgrep\ -U]]
    opt.grepformat = [[%f:%l:%c:%m,%f:%l:%m]]
elseif fn.executable("ack") == 1 then
    -- Ack
    opt.grepprg = [[ack\ -s\ -H\ --nopager\ --nocolor\ --nogroup\ --column]]
    opt.grepformat = [[%f:%l:%c:%m,%f:%l:%m]]
elseif fn.executable("findstr") == 1 then
    -- Microsoft FindStr
    opt.grepprg = [[findstr\ /s\ /n\ $*\ nul]]
elseif fn.executable("rg") == 1 then
    -- RipGrep
    opt.grepprg = [[rg\ --vimgrep\ --no-heading\ --smart-case\ -u]]
    opt.grepformat = [[%f:%l:%c:%m,%f:%l:%m]]
end

-- Try to set the language, fail silently
cmd.source(stdconfig .. "/trylang.vim")

-- C
g.c_gnu = 1
g.c_space_errors = 1
g.ch_syntax_for_h = 1

-- LISP
g.lisp_rainbow = 1

-- Python
g.python_highlight_all = 1

cmd.source(stdconfig .. "/filetype.vim")

