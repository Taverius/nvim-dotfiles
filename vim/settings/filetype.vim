"   vi: tw=100
" vim/settings/filetype.vim @ (c) Leonardo Valeri Manera 2022

" Python
" Delete trailing whitespace on save
augroup nviPython
    autocmd!
    autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre *.py :lua MiniTrailspace.trim()
    autocmd FileType python autocmd BufWritePre <buffer> :lua MiniTrailspace.trim()
augroup END

" VimL
augroup nviVimL
    autocmd!
    autocmd FileType vim if bufname('') =~# '^\%(\[Command Line\]\|option-window\)$' | setlocal nofoldenable | endif
augroup END

