"   vi: foldmethod=marker tw=100
" plugins/vim-startify.vim @ (c) Leonardo Valeri Manera 2022

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

