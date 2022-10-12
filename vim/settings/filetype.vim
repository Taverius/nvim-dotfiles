"   vi: foldmethod=marker tw=100
" fragments/settings/filetype.vim @ (c) Leonardo Valeri Manera 2022

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
augroup nviCSharp
    autocmd!
    autocmd FileType cs call CSharpFold()
    autocmd FileType cs setl fen
    autocmd FileType cs setl omnifunc=syntaxcomplete#Complete
augroup END

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

