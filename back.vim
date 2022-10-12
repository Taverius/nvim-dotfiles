"   vi: foldmethod=marker
" init.vim @ (c) Leonardo Valeri Manera 2022

" Set mapleader early
let mapleader = ","
let g:mapleader = ","

" If on windows, set shell to PowerShell
" early so vim-plug can self-install
if has('windows')
    let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
    let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;'
    let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    set shellquote= shellxquote=
endif

" Disable unused providers
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:loaded_node_provider = 0

" Set python binary
let g:python3_host_prog = 'C:\Dev\Python\3\python.exe'

" ====================================
" ==============  Plug  ==============
" ====================================
" {{{

" Install vim-plug if not found
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Required
call plug#begin()

function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" For Help
Plug 'junegunn/vim-plug'

" So many things want YARP
Plug 'roxma/nvim-yarp', Cond(has('python3'), { 'do': 'python -m pip install --user --upgrade pynvim' })

" Dressing
Plug 'stevearc/dressing.nvim'

" Notify
Plug 'rcarriga/nvim-notify'

" SQLite
" Plug 'kkharji/sqlite.lua'

" Plenary
Plug 'nvim-lua/plenary.nvim'

" DevIcons
Plug 'kyazdani42/nvim-web-devicons'

" Startify
Plug 'mhinz/vim-startify'

" Auto save
Plug 'Pocco81/auto-save.nvim'

" Repeat
Plug 'tpope/vim-repeat'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-visualrepeat'

" Shougo utilities
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-vim', Cond(has('python3'))
Plug 'Shougo/neoinclude.vim', Cond(has('python3'))

" Telescope
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', Cond(executable('cmake'), { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' })
Plug 'LukasPietzschmann/telescope-tabs'
Plug 'smartpde/telescope-recent-files'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" What?
Plug 'folke/which-key.nvim'
Plug 'mrjones2014/legendary.nvim'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'

" Undotree
Plug 'jiaoshijie/undotree'

" Buffer stuff
Plug 'artnez/vim-wipeout'
Plug 'smitajit/bufutils.vim'

" Tree
Plug 'kyazdani42/nvim-tree.lua'

" NCM2 (Python 3)
Plug 'ncm2/ncm2', Cond(has('python3'))
Plug 'ncm2/ncm2-bufword', Cond(has('python3'))
Plug 'ncm2/ncm2-path', Cond(has('python3'))
Plug 'ncm2/ncm2-tagprefix', Cond(has('python3'))
Plug 'ncm2/ncm2-gtags', Cond(has('python3'))
Plug 'ncm2/ncm2-syntax', Cond(has('python3'))
Plug 'ncm2/ncm2-neoinclude', Cond(has('python3'))
Plug 'yuki-ycino/ncm2-dictionary', Cond(has('python3'))
Plug 'fgrsnau/ncm2-aspell', Cond(has('python3'))
Plug 'ncm2/ncm2-vim', Cond(has('python3'))
Plug 'svermeulen/ncm2-yoink', Cond(has('python3'))

" AsynComplete (VimL)
Plug 'prabirshrestha/asyncomplete.vim', Cond(!has('python3'))
Plug 'prabirshrestha/asyncomplete-buffer.vim', Cond(!has('python3'))
Plug 'prabirshrestha/asyncomplete-tags.vim', Cond(!has('python3'))
Plug 'prabirshrestha/asyncomplete-file.vim', Cond(!has('python3'))
Plug 'yami-beta/asyncomplete-omni.vim', Cond(!has('python3'))

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" Bufferline
Plug 'kdheepak/tabline.nvim'

" Motions
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'

" Misc
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-fnr'
Plug 'junegunn/vim-peekaboo'
Plug 'matze/vim-move'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'Raimondi/VimRegEx.vim'
Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'
Plug 'mrmargolis/dogmatic.vim'

" Filetypes
Plug 'sheerun/vim-polyglot'
Plug 'k-takata/vim-nsis'

" Colorschemes
Plug 'projekt0n/github-nvim-theme'
Plug 'rktjmp/lush.nvim'
Plug 'npxbr/gruvbox.nvim'
Plug 'savq/melange'
Plug 'olimorris/onedark.nvim'
Plug 'casonadams/walh'
Plug 'catppuccin/nvim', { 'as': 'catpuccin' }
Plug 'mrjones2014/lighthaus.nvim'

" Required
call plug#end()

" }}}

" ====================================
" ========== Simple options ==========
" ====================================
" {{{

set number              " Show line numbers.
set shiftwidth=4        " Indent 4 spaces by default.
set softtabstop=4       " Use 4 spaces instead of a Tab.
set shiftround          " Round indent (<,>) to multiples of 'shiftwidth'
set expandtab           " Convert tabs to spaces.
set lazyredraw          " Avoid redrawing the screen mid-command
set visualbell          " Visual bell.
set backspace=3         " Backspace like normal apps.
set confirm             " Instead of failing because of unsaved changes,
                        " raise a dialogue
set whichwrap=b,s,<,>,h,l,~,[,]
                        " Make left & right wrap around lines.
set showmatch           " Highlight matching parens.
set matchtime=2         " for .2 seconds.
set matchpairs+=<:>     " Add <> to highlighted matches.
set showfulltag         " Show full tags when doing search completion.
set switchbuf=useopen,usetab
                        " Allow changing windows/tabs for quickfix/:sb/etc
set scrolloff=5         " Try to show at least three lines.
set sidescrolloff=2     " and two columns of context when scrolling.
set smartindent         " Smart indenting
set undolevels=10000    " 10000 undos.
set ignorecase infercase smartcase
                        " Make Vim case-insensitive but smart about it.
set report=0            " : commands always print changed line count.
set shortmess=atTI      " Use [+]/[RO]/[w] for modified/readonly/written.
set display+=uhex       " Show unprintable characters as <xx>.
set formatoptions+=1    " don't break a line after a 1-letter word,
                        " break before if possible
set fileformats=unix,dos,mac
                        " default file type.
set autochdir           " Automatically change CWD
set showtabline=2       " Always show tab line.
set diffopt+=vertical   " Vertical diff by default
set clipboard=unnamedplus
                        " Clipboard is the + register.
set mouse=ar            " Full mouse support. Screw the hipsters!
set numberwidth=2       " Set minimum number column width to 1 digit + space.
set breakindent         " every wrapped line will continue visually indented.
set breakindentopt=sbr  " show 'showbreak' value before the indent
set updatetime=100      " Faster update
set printoptions+=syntax:y
                        " Syntax when printing.
set virtualedit=block,onemore
                        " Enable virtual edit in vblock mode, and one past the end.
set completeopt+=menuone,longest
                        " Also show the menu when there is only one option, and
                        " only insert the longest common text
set wildmode=longest:full,full
                        " Complete till longest common string, and start
                        " wildmenu
set shada=!,'1000,<1000,s250,h,f1,%
                        " Big fat shada file
set concealcursor=nc    " Conceal cursor line text also in normal mode and incsearch
set conceallevel=2      " Text is completely hidden unless it has replacement text defined
set laststatus=3        " Common status line
set showbreak=…         " Linebreaks and various metacharacters
set list listchars=tab:→\ ,trail:·,extends:…,precedes:…,nbsp:=
set fillchars=fold:-

" }}}

" ====================================
" ========= Complex options ==========
" ====================================
" {{{

" Generic function to check if a buffer is backed by a file
function! BufferHasFileCheck()
    if &buftype =~? 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    return 1
endfunction

" Terminal stuff
function! TerminalTrueColorCheck()
    if $TERM =~ '^\(rxvt\|screen\|interix\|putty\|win32con\)\(-.*\)\?$'
        set notermguicolors
    elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\|vtpcon\|conemu\)\(-.*\)\?$'
        set termguicolors
    elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
        if $XTERM_VERSION != ''
            set termguicolors
        elseif $KONSOLE_PROFILE_NAME != ''
            set termguicolors
        elseif $VTE_VERSION != ''
            set termguicolors
        else
            set notermguicolors
        endif
    endif
endfunction
augroup vimrcTerminalColors
    autocmd!
    autocmd UIEnter * call TerminalTrueColorCheck()
augroup END

" Folding stuff
set foldmethod=syntax
set foldlevelstart=99
set foldcolumn=2
" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
augroup vimrcFoldInsert
    autocmd!
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END

" Fancy cursor line/column stuff
augroup vimrcCursorHighlight
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END
set cursorline
set cursorcolumn

" Undo file stuff
set undofile
augroup vimrcUndoFile
    autocmd!
    " Only set undofile for buffers backed by a file
    autocmd BufWritePost ?* if !BufferHasFileCheck() | setlocal noundofile | endif
    autocmd BufWinEnter  ?* if !BufferHasFileCheck() | setlocal noundofile | endif
augroup END

" View file stuff
set viewoptions-=curdir
let g:skipview_files = []
function! MakeViewCheck()
    " Filter out undesirables
    if !BufferHasFileCheck()
        " Buffer is not backed by a file
        return 0
    endif
    if len($TEMP) && expand('%:p:h') == $TEMP
        " We're in a temp dir
        return 0
    endif
    if len($TMP) && expand('%:p:h') == $TMP
        return 0
    endif
    if index(g:skipview_files, expand('%'), 0, 1) >= 0
        " File is in skip list
        return 0
    endif
    return 1
endfunction
" Autosave & Load Views.
augroup vimrcAutoView
    autocmd!
    autocmd BufWritePost,BufLeave,WinLeave,FocusLost ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup END

" When Vim loses focus, save the file
augroup vimrcSaveOnFocusLost
    autocmd!
    autocmd FocusLost * silent! :wall
augroup END

" Ctags
if has('win32') || has('win64')
    if executable('ctags.exe')
        let g:ctags_location = 'ctags.exe'
    else
        let g:ctags_location = expand('C:/Dev/Ctags/ctags')
    endif
else
    if executable('ctags-universal')
        let g:ctags_location = 'ctags-universal'
    elseif executable('ctags-exuberant')
        let g:ctags_location = 'ctags-exuberant'
    elseif executable('exctags')
        let g:ctags_location = 'exctags'
    else
        let g:ctags_location = 'ctags'
    endif
endif

" Grep
if executable('ag')
    " The Silver Searcher
    set grepprg=ag\ --vimgrep\ -U
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('ack')
    " Ack
    set grepprg=ack\ -s\ -H\ --nopager\ --nocolor\ --nogroup\ --column
    set grepformat=%f:%l:%c:%m,%f:%l:%m
elseif executable('findstr')
    set grepprg=findstr\ /s\ /n\ $*\ nul
elseif executable('rg')
    " Ripgrep
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ -u
    set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" Try to set language.
try
    language en
    language en_US
    language en_GB
    language ctype C
    language time it_IT
catch
endtry

" }}}

" ====================================
" =============== Maps ===============
" ====================================
" {{{

" , is mapleader, so rebind ,, to ,
nnoremap <silent> ,, ,
vnoremap <silent> ,, ,

nnoremap <silent> ;; ;
vnoremap <silent> ;; ;
nnoremap ; :
vnoremap ; :
nnoremap <M-;> ;
vnoremap <M-;> ;
nnoremap q; q:
vnoremap q; q:
                        " Pure genius.

" Folding
nnoremap <silent> <C-Space>      @=(foldlevel('.')?'za':'l')<CR>
vnoremap <silent> <C-Space>      @=(foldlevel('.')?'za':'l')<CR>
inoremap <silent> <C-Space> <C-o>@=(foldlevel('.')?'za':'l')<CR>

" Let Control-S be 'save' as it is in most other editors
" Bug: this puts you into insert mode if you were in overwrite mode before
 noremap <C-s>      :w<CR>
inoremap <C-s> <C-o>:w<CR>

noremap <leader>v :e! $MYVIMRC<CR>
                        " Fast editing of the .vimrc.

" qq to record, Q to replay
nnoremap Q @q

noremap <S-cr> <Esc>
                        " Shift-Enter = ESC.

nnoremap <silent> \ :noh<CR>
                        " Clears search pattern

" Tabwidth.
map <leader>t2 :setlocal shiftwidth=2<CR>
map <leader>t4 :setlocal shiftwidth=4<CR>
map <leader>t8 :setlocal shiftwidth=8<CR>

" Pressing an 'enter visual mode' key while in visual mode changes mode.
vmap <C-V> <ESC>`<<C-v>`>
vmap V     <ESC>`<V`>
vmap v     <ESC>`<v`>

" Remove the Windows ^M - when the encodings gets messed up.
noremap <leader>M mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" This mapping allows to stay in visual mode when indenting with < and >
vnoremap > >gv
vnoremap < <gv

" These mappings are useful in long wrapped lines when pressing j or k
nnoremap <C-down> gj
nnoremap <C-up> gk

" tag movement
noremap <C-]> g<C-]>
noremap <C-g> g<C-g>

" quickfix
noremap <leader>cc :cclose<bar>lclose<CR>
augroup vimrcQfClose
    autocmd!
    autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END

" circular window navigation
nnoremap <tab>   <C-w>w
nnoremap <S-tab> <C-w>W

" tab configuration
nnoremap <leader>tn :tabnew %<CR>
nnoremap <leader>te :tabedit
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>tm :tabmove

set pastetoggle=<F1>    " F1 toggles paste mode

" F2 -> Toggle list
 noremap <F2>      :set list!<CR>:set list?<CR>
inoremap <F2> <C-o>:set list!<CR><C-O>:set list?<CR>

" Rotate through languages of spelling checker.
let loaded_spellfile_plugin = 1
let g:my_lang_codes = [ 'en_gb', 'it', 'en_gb,it' ]
if !exists('g:MY_LANG_IDX') || ( g:MY_LANG_IDX + 1 < len(g:my_lang_codes) )
    let g:MY_LANG_IDX = 0
endif
function! MySpellLang()
    exec "setlocal" "spelllang=".get(g:my_lang_codes, g:MY_LANG_IDX)
    let g:MY_LANG_IDX = ( g:MY_LANG_IDX + 1 < len(g:my_lang_codes) ) ? g:MY_LANG_IDX + 1 : 0
endfunction
" F4 -> Toggle Spellcheck
" Control-F4 -> Cycle language
 noremap <silent>   <F4>      :setlocal spell!<CR>
inoremap <silent>   <F4> <C-o>:setlocal spell!<CR>
 noremap <silent> <C-F4>      :call <SID>MySpellLang()<CR>
inoremap <silent> <C-F4> <C-o>:call <SID>MySpellLang()<CR>

" Function used to display syntax group.
function! SyntaxItem()
    return join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

" <leader>syn -> show syntax group under cursor
noremap <silent> <Leader>syn :echo <SID>SyntaxItem()<CR>

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

" }}}

" ====================================
" =========== Colorscheme ============
" ====================================
" {{{

colorscheme github_dimmed

" }}}

" ====================================
" =========== Window Title ===========
" ====================================
" {{{

set titlestring=
set titlestring+=%f\                                                " file name
set titlestring+=%h%m%r%w                                           " flags
set titlestring+=\ -\ %{substitute(expand(v:progname),\ '\.exe',\ '',\ '')}
                                                                    " program name
set titlestring+=\ -\ %{substitute(getcwd(),\ $HOME,\ '~',\ '')}    " working directory

" }}}

" ====================================
" ============= Filetype =============
" ====================================
" {{{

" C
let g:c_gnu = 1
let g:c_space_errors = 1
let g:ch_syntax_for_h = 1

" C#
function! CSharpFold()
    setl foldmethod=marker
    setl foldmarker={,}
    function! FoldCSharp()
        return substitute(getline(v:foldstart),'{.*','{...}',)
    endfunction
    setl foldtext=FoldCSharp()
    setl foldlevelstart=2
endfunction
augroup vimrcCSharp
    autocmd!
    autocmd FileType cs call CSharpFold()
    autocmd FileType cs setl fen
    autocmd FileType cs setl omnifunc=syntaxcomplete#Complete
augroup END

" LISP
let g:lisp_rainbow = 1

" Python
let g:python_highlight_all = 1
function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction
augroup vimrcPython
    autocmd!
    autocmd BufWrite *.py :call DeleteTrailingWS()
augroup END

" VimL
augroup vimrcVIML
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim if bufname('') =~# '^\%(' . '\[Command Line\]' . '\|option-window\)$' | setlocal nofoldenable | endif
augroup END

" }}}

" ====================================
" ============= Plug-ins =============
" ====================================
" {{{

packadd! matchit

let g:yoinkIncludeDeleteOperations = 1

" vim-plug {{{
" change how the Plug windows are opened
let g:plug_window = '-tabnew'
let g:plug_pwindow = 'vertical rightbelow new'
" }}}

" asynccomplete.vim {{{
if !has('python3')
    " Maps
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

    " Sources
    augroup vimrcAsyncCompleteSources
        autocmd!
        autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
                    \ 'name': 'buffer',
                    \ 'whitelist': ['*'],
                    \ 'blacklist': ['go'],
                    \ 'completor': function('asyncomplete#sources#buffer#completor'),
                    \ 'config': {
                    \    'max_buffer_size': 5000000,
                    \  },
                    \ }))
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
                    \ 'name': 'tags',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#tags#completor'),
                    \ 'config': {
                    \    'max_buffer_size': 5000000,
                    \  },
                    \ }))
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
                    \ 'name': 'file',
                    \ 'whitelist': ['*'],
                    \ 'priority': 10,
                    \ 'completor': function('asyncomplete#sources#file#completor'),
                    \ }))
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                    \ 'name': 'omni',
                    \ 'allowlist': ['*'],
                    \ 'blocklist': ['c', 'cpp', 'html', 'rb'],
                    \ 'completor': function('asyncomplete#sources#omni#completor'),
                    \ 'config': {
                    \   'show_source_kind': 1,
                    \  },
                    \ }))
    augroup END
endif
" }}}

" vim-bookmarks {{{
" F5 -> Toggle Bookmark
" F6 -> Next Bookmark
" F7 -> Previous Bookmark
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_manage_per_buffer = 1
nmap <silent> <F5>      <Plug>BookmarkToggle
nmap <silent> <F6>      <Plug>BookmarkNext
nmap <silent> <F7>      <Plug>BookmarkPrev
" }}}

" bufutils.vim/vim-wipeout {{{
" Some handy mappings
nnoremap <leader>bp :BClosePreviews<CR>
nnoremap <leader>ba :BCloseAll<CR>
nnoremap <leader>bc :BCloseThis<CR>
nnoremap <leader>bw :Wipeout<CR>
" }}}

" vim-characterize {{{
" ga is used easy-align
nmap <leader>utf    <Plug>(characterize)
" }}}

" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap ga <Plug>(EasyAlign)
" custom patterns
let g:easy_align_delimiters = {
            \ '>': { 'pattern': '>>\|=>\|>' },
            \ '\': { 'pattern': '\\' },
            \ '/': {
            \     'pattern': '//\+\|/\*\|\*/',
            \     'delimiter_align': 'l',
            \     'ignore_groups': ['!Comment']
            \   },
            \ ']': {
            \     'pattern':       '\]\zs',
            \     'left_margin':   0,
            \     'right_margin':  1,
            \     'stick_to_left': 0
            \   },
            \ ')': {
            \     'pattern':       ')\zs',
            \     'left_margin':   0,
            \     'right_margin':  1,
            \     'stick_to_left': 0
            \   },
            \ 'f': {
            \     'pattern': ' \(\S\+(\)\@=',
            \     'left_margin': 0,
            \     'right_margin': 0
            \   },
            \ 'd': {
            \     'pattern': ' \ze\S\+\s*[;=]',
            \     'left_margin': 0,
            \ 'right_margin': 0
            \   },
            \ 'n' : {
            \     'pattern' : '\(\ =\|,\)',
            \     'left_margin' : 0,
            \     'mode_sequence' : 'lr*'
            \   }
            \ }
" }}}

" echodoc.vim {{{
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'

augroup vimrcEchodocHighlight
    autocmd!
    autocmd ColorScheme * highlight clear EchoDocPopup
    autocmd ColorScheme * highlight! link EchoDocPopup        Pmenu
augroup END
" }}}

" vim-sneak {{{
let g:sneak#label = 1
 map f <Plug>Sneak_f
 map F <Plug>Sneak_F
 map t <Plug>Sneak_t
 map T <Plug>Sneak_T
" }}}

" is.vim {{{
" vim-asterisk maps
 map *   <Plug>(asterisk-*)<Plug>(is-nohl-1)
 map g*  <Plug>(asterisk-g*)<Plug>(is-nohl-1)
 map #   <Plug>(asterisk-#)<Plug>(is-nohl-1)
 map g#  <Plug>(asterisk-g#)<Plug>(is-nohl-1)

 map z*  <Plug>(asterisk-z*)<Plug>(is-nohl-10)
 map gz* <Plug>(asterisk-gz*)<Plug>(is-nohl-10)
 map z#  <Plug>(asterisk-z#)<Plug>(is-nohl-10)
 map gz# <Plug>(asterisk-gz#)<Plug>(is-nohl-10)
" }}}

" vim-numbertoggle {{{
" Don't use the default binds
let g:UseNumberToggleTrigger = 0
" F3 -> Toggle relative number
 map <silent> <F3>      <Plug>NumberToggleTrigger
imap <silent> <F3> <C-o><Plug>NumberToggleTrigger
" }}}

" vim-startify {{{
" If we have UTF8 capability, use it
let g:startify_fortune_use_unicode = 1
let g:startify_files_number        = 8
let g:startify_session_autoload    = 0
let g:startify_session_persistence = 0
" Bookmarks, skip list, filters
let g:startify_custom_header = [
            \ '                                   __                ',
            \ '      ___     ___    ___   __  __ /\_\    ___ ___    ',
            \ '     / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ',
            \ '    /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ',
            \ '    \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\',
            \ '     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/',
            \ ]
let g:startify_skiplist = [
            \ 'runtime/doc/.*\.txt$',
            \ 'bundle/.*/doc/.*\.txt$',
            \ 'plugged/.*/doc/.*\.txt$',
            \ '/.git/',
            \ 'fugitiveblame$',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc/.*\.txt$',
            \ 'runtime\\doc\\.*\.txt$',
            \ 'bundle\\.*\\doc\\.*\.txt$',
            \ 'plugged\\.*\\doc\\.*\.txt$',
            \ '\\.git\\',
            \ escape(fnamemodify(resolve($VIMRUNTIME), ':p'), '\') .'doc\\.*\.txt$',
            \ 'COMMIT_EDITMSG',
            \ '.*/init.vim$',
            \ '.*\\init.vim$',
            \ '.*/ginit.vim$',
            \ '.*\\ginit.vim$',
            \ ]
let g:startify_bookmarks = [
            \ { 'i' : escape(fnamemodify(stdpath('config') . '\init.vim', ':~:gs?\?/?'), '\') },
            \ { 'g' : escape(fnamemodify(stdpath('config') . '\ginit.vim', ':~:gs?\?/?'), '\') },
            \ ]
let g:startify_transformations = [
            \ ['.*/init.vim$', 'init'],
            \ ['.*\\init.vim$', 'init'],
            \ ['.*/ginit.vim$', 'ginit'],
            \ ['.*\\ginit.vim$', 'ginit'],
            \ ]
" }}}

