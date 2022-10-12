"   vi: foldmethod=marker tw=100
" fragments/settings/foldinsert.vim @ (c) Leonardo Valeri Manera 2022

augroup nviFoldInsert
    autocmd!
    autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
    autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END

