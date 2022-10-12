--   vi: tw=100
-- lua/settings.lua @ Leonardo Valeri Manera 2022

local stdconfig = vim.fn.stdpath('config') .. "/vim/settings"

-- -- If we're on windows, check if powershell is available
-- if vim.fn.has('windows') == 1 and ( vim.fn.executable('pwsh') == 1 or vim.fn.executable('powershell') == 1 ) then
--     vim.o.shell = ( vim.fn.executable('pwsh') == 1 ) and 'pwsh' or 'powershell'
--     vim.o.shellcmdflag = [[-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;]]
--     vim.o.shellredir = [[2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode]]
--     vim.o.shellpipe = [[2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode]]
--     vim.o.shellquote = ''
--     vim.o.shellxquote = ''
-- end

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Set Python 3 binary
if vim.fn.executable('C:/Dev/Python/3/python.exe') == 1 then
    vim.g.python3_host_prog = 'C:/Dev/Python/3/python.exe'
end

-- NetRW is naughty
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = ","                       -- Set the Map Leader early
vim.o.pastetoggle = "<F1>"                  -- Toggle Paste mode with F1
vim.o.number = true                         -- Show line numbers
vim.o.shiftwidth = 4                        -- Indent by 4 spaces
vim.o.softtabstop = 4                       -- Use 4 spaces instead of tab
vim.o.shiftround = true                     -- Round indent (<,>) to multiples of 'shiftwidth'
vim.o.expandtab = true                      -- Convert tabs to spaces
vim.o.lazyredraw = true                     -- Don't redraw the screen mid-command
vim.o.visualbell = true                     -- Flash the screen instead of beeping
vim.o.backspace = 3                         -- Backspace like normal apps
vim.o.confirm = true                        -- Instead of failing because of unsaved changes, raise
                                            -- a dialogue
vim.o.whichwrap = "b,s,<,>,h,l,~,[,]"       -- Make left & right movements wrap around lines always
vim.o.showmatch = true                      -- Highlight matching paretheses
vim.o.matchtime = 2                         -- For 0.2 seconds
vim.opt.matchpairs:append { "<:>" }         -- Add <> to hightlighted matches
vim.o.showfulltag = true                    -- Show full tags when doing search completion
vim.o.switchbuf = "useopen,usetab"          -- Allow changing windows/tabs for quickfix/:sb/etc
vim.o.scrolloff = 5                         -- Try to show at least 5 lines
vim.o.sidescrolloff = 2                     -- and 2 columns of context when scrolling
vim.o.smartindent = true                    -- Smart indenting
vim.o.undolevels = 10000                    -- Many undos
vim.o.ignorecase = true                     -- Ignore case but infer it from context and turn
vim.o.infercase = true                      -- it back on when using a capital letter in
vim.o.smartcase = true                      -- a search
vim.o.report = 0                            -- : commands always show changed line count
vim.o.shortmess = "filnrxoOstTIcq"          -- Set abbreviation options for prompts
vim.opt.display:append { "uhex" }           -- Show unprintable characters as <xxx>
vim.opt.formatoptions:append { "1" }        -- If possible, break a line before a 1-letter word
vim.o.fileformats = "unix,dos,mac"          -- File type order
vim.o.autochdir = true                      -- Automatically change CWD
vim.o.showtabline = 2                       -- Always show tab line
vim.opt.diffopt:append { "vertical" }       -- Vertical diff by default
vim.o.clipboard = "unnamedplus"             -- Clipboard is the + register
vim.o.mouse = "ar"                          -- Full mouse support and damn the hipsters
vim.o.numberwidth = 2                       -- Minimum Number column width is 1 digit + space
vim.o.breakindent = true                    -- Every wrapped line will continue visually indented
vim.o.breakindentopt = "sbr"                -- Show the break character before a wrapped line
vim.o.updatetime = 100                      -- Faster ASync updates
vim.opt.printoptions:append { "syntax:y" }  -- Syntax when printing
vim.o.virtualedit = "block,onemore"         -- Virtual edit in VBlock mode, and one past the end
vim.opt.completeopt:append { "menuone", "longest" }
                                            -- Also show the menu when there is only one option,
                                            -- and only insert the longest common text
vim.opt.wildmode:prepend { "longest:full" } -- Complete to longest common string first
vim.o.shada = "!,'1000,<1000,s250,h,f1,%"   -- My Big Fat Shada File
vim.o.concealcursor = "nc"                  -- Conceal cursor line text also in mormal mode and
                                            -- incsearch
vim.o.conceallevel = 2                      -- Concealed text is completely hidden unless it has
                                            -- replacement text defined
vim.o.laststatus = 3                        -- Common status line
vim.o.showbreak = "…"                       -- Linebreaks and other metatextual characters
vim.o.list = true
vim.o.listchars = "tab:→ ,trail:·,extends:…,precedes:…,nbsp:="
vim.o.fillchars = "fold:-"
vim.o.foldmethod = "syntax"                 -- Fold with syntax by default
vim.o.foldlevelstart = 99                   -- Start with all folds open
vim.o.foldcolumn = "2"                      -- Always display a 2-character fold column
vim.o.cursorline = true                     -- Always show cursor line
vim.o.cursorcolumn = true                   -- Always show cursor column
vim.o.undofile = true                       -- Undo files please
vim.opt.viewoptions:remove { "curdir" }     -- Don't save $CWD in the view file
local titlestring = [[%f\]] .. [[%h%m%r%w]] -- File name & flags
titlestring = titlestring .. [[\ -\ %{substitute(expand(v:progname),\ '\.exe',\ '',\ '')}]]
                                            -- Program name
titlestring = titlestring .. [[\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}]]
                                            -- Working directory
vim.o.titlestring = titlestring


-- Don't screw up folds when inserting text that might affect them, until
-- leaving insert mode. Foldmethod is local to the window. Protect against
-- screwing up folding when switching between windows.
vim.cmd.source(stdconfig .. "/foldinsert.vim")

-- Terminal color checks
vim.cmd.source(stdconfig .. "/termcolor.vim")

-- Toggle cursor line/column highlight only for the active window
vim.cmd.source(stdconfig .. "/cursorhl.vim")

-- Generic function to check if a buffer is backed by a file
vim.cmd.source(stdconfig .. "/bufhasfile.vim")

-- Undo file automation
vim.cmd.source(stdconfig .. "/undofile.vim")

-- View file automation
vim.cmd.source(stdconfig .. "/viewfile.vim")

-- When NVim loses focus, save
-- vim.cmd.source(stdconfig .. "/savefocus.vim")

-- CTags
if vim.fn.has('win32') == 1 or vim.fn.has('win64') == 1 then
    if vim.fn.executable('ctags') == 1 then
        vim.g.ctags_location = "ctags"
    else
        vim.g.ctags_location = vim.fn.expand("C:/Dev/Ctags/ctags")
    end
else
    if vim.fn.executable("ctags-universal") == 1 then
        vim.g.ctags_location = "ctags-universal"
    elseif vim.fn.executable("ctags-exuberant") == 1 then
        vim.g.ctags_location = "ctags-exuberant"
    elseif vim.fn.executable("exctags") == 1 then
        vim.g.ctags_location = "exctags"
    else
        vim.g.ctags_location = "ctags"
    end
end

-- Grep selection
if vim.fn.executable('ag') == 1 then
    -- The Silver Searcher
    vim.o.grepprg = [[ag\ --vimgrep\ -U]]
    vim.o.grepformat = [[%f:%l:%c:%m,%f:%l:%m]]
elseif vim.fn.executable('ack') == 1 then
    -- Ack
    vim.o.grepprg = [[ack\ -s\ -H\ --nopager\ --nocolor\ --nogroup\ --column]]
    vim.o.grepformat = [[%f:%l:%c:%m,%f:%l:%m]]
elseif vim.fn.executable('findstr') == 1 then
    -- Microsoft FindStr
    vim.o.grepprg = [[findstr\ /s\ /n\ $*\ nul]]
elseif vim.fn.executable('rg') == 1 then
    -- RipGrep
    vim.o.grepprg = [[rg\ --vimgrep\ --no-heading\ --smart-case\ -u]]
    vim.o.grepformat = [[%f:%l:%c:%m,%f:%l:%m]]
end

-- Try to set the language, fail silently
vim.cmd.source(stdconfig .. "/trylang.vim")

-- C
vim.g.c_gnu = 1
vim.g.c_space_errors = 1
vim.g.ch_syntax_for_h = 1

-- LISP
vim.g.lisp_rainbow = 1

-- Python
vim.g.python_highlight_all = 1

vim.cmd.source(stdconfig .. "/filetype.vim")

