"   vi: foldmethod=marker tw=100
" fragments/mappings/qfclose.vim @ (c) Leonardo Valeri Manera 2022

augroup nviQfClose
    autocmd!
    autocmd FileType qf if mapcheck('<esc>', 'n') ==# '' | nnoremap <buffer><silent> <esc> :cclose<bar>lclose<CR> | endif
augroup END

