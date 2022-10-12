"   vi: foldmethod=marker tw=100
" fragments/settings/cursorhl.vim @ (c) Leonardo Valeri Manera 2022

augroup nviCursorHighlight
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

