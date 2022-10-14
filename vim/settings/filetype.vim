"   vi: foldmethod=marker tw=100
" fragments/settings/filetype.vim @ (c) Leonardo Valeri Manera 2022

" Python
function! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunction
augroup nviPython
    autocmd!
    autocmd BufWrite *.py :call DeleteTrailingWS()
augroup END

" VimL
augroup nviVimL
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim if bufname('') =~# '^\%(\[Command Line\]\|option-window\)$' | setlocal nofoldenable | endif
augroup END

