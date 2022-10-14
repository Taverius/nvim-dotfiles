"   vi: tw=100
" fragments/settings/filetype.vim @ (c) Leonardo Valeri Manera 2022

" Python
function! DeleteTrailingWS()
    if !&binary && &filetype != 'diff'
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endif
endfunction
augroup nviPython
    autocmd!
    autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre *.py :call DeleteTrailingWS()
    autocmd FileType python autocmd BufWritePre <buffer> :call DeleteTrailingWS()
augroup END

" VimL
augroup nviVimL
    autocmd!
    autocmd FileType vim if bufname('') =~# '^\%(\[Command Line\]\|option-window\)$' | setlocal nofoldenable | endif
augroup END

