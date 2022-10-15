"   vi: tw=100
" vim/plugins.vim @ (c) Leonardo Valeri Manera 2022

" Install vim-plug if not found
let data_dir = stdpath('data') . '/site'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    augroup nviPlugBootstrap
        autocmd!
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    augroup END
endif

" Run PlugInstall if there are missing plugins
augroup nviPlugInstall
    autocmd!
    autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        \| PlugInstall --sync | source $MYVIMRC
        \| endif
augroup END

" Required
call plug#begin()

function! Cond(cond, ...)
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

" For Help
Plug 'junegunn/vim-plug'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

" YARP
Plug 'roxma/nvim-yarp', Cond(has('python3'), { 'do': 'python -m pip install --upgrade wheel pynvim neovim-remote virtualenv' })

" Vim-Matchup
Plug 'andymass/vim-matchup'

" Dressing
Plug 'stevearc/dressing.nvim'

" Notify
Plug 'rcarriga/nvim-notify'

" Plenary
Plug 'nvim-lua/plenary.nvim'

" DevIcons
Plug 'kyazdani42/nvim-web-devicons'

" Dashboard
Plug 'goolord/alpha-nvim'

" Auto save
Plug 'Pocco81/auto-save.nvim'

" The FZF Plugin
Plug 'junegunn/fzf', Cond(executable('fzf'))

" Repeat
Plug 'tpope/vim-repeat'
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-visualrepeat'

" Shougo utilities
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'

" Telescope
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
if executable('cmake')
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
elseif executable('make')
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
else
    Plug 'nvim-telescope/telescope-fzf-native.nvim'
endif
Plug 'LukasPietzschmann/telescope-tabs'
Plug 'smartpde/telescope-recent-files'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Bindings help
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

" Fern
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'yuki-yano/fern-preview.vim'

" The artist formerly known as the artist formerly known as vim-easyclip
Plug 'gbprod/cutlass.nvim'
Plug 'gbprod/yanky.nvim'

" COQ
" Plug 'ms-jpq/coq_nvim', Cond(has('python3'), {'branch': 'coq'})
Plug 'ms-jpq/coq_nvim', Cond(has('python3'), {'commit': '84ec5faf2aaf49819e626f64dd94f4e71cf575bc'})
Plug 'ms-jpq/coq.artifacts', Cond(has('python3'), {'branch': 'artifacts'})
Plug 'ms-jpq/coq.thirdparty', Cond(has('python3'), {'branch': '3p'})

" AsynComplete (VimL)
Plug 'prabirshrestha/asyncomplete.vim', Cond(!has('python3'))
Plug 'prabirshrestha/asyncomplete-buffer.vim', Cond(!has('python3'))
Plug 'prabirshrestha/asyncomplete-tags.vim', Cond(!has('python3'))
Plug 'prabirshrestha/asyncomplete-file.vim', Cond(!has('python3'))
Plug 'yami-beta/asyncomplete-omni.vim', Cond(!has('python3'))

" Tags
Plug 'skywind3000/vim-gutentags', {'on': []}

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" Bufferline
Plug 'kdheepak/tabline.nvim'

" Motions
Plug 'ggandor/lightspeed.nvim'
Plug 'haya14busa/vim-asterisk'
Plug 'haya14busa/is.vim'

" Misc
Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-peekaboo'
Plug 'matze/vim-move'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-unimpaired'
Plug 'numToStr/Comment.nvim'
Plug 'gbprod/stay-in-place.nvim'

" VimRegEx helper
Plug 'Raimondi/VimRegEx.vim'

" Filetypes
Plug 'sheerun/vim-polyglot'
Plug 'k-takata/vim-nsis'

" Colorschemes
Plug 'projekt0n/github-nvim-theme'
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'savq/melange'
Plug 'olimorris/onedark.nvim'
Plug 'casonadams/walh'
Plug 'catppuccin/nvim', { 'as': 'catppuccin.nvim' }
Plug 'mrjones2014/lighthaus.nvim'

" Required
call plug#end()

