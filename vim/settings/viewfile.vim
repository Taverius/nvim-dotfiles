"   vi: foldmethod=marker tw=100
" fragments/settings/viewfile.vim @ (c) Leonardo Valeri Manera 2022

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
augroup nviAutoView
    autocmd!
    autocmd BufWritePost,BufLeave,WinLeave,FocusLost ?* if MakeViewCheck() | mkview | endif
    autocmd BufWinEnter ?* if MakeViewCheck() | silent! loadview | endif
augroup END

