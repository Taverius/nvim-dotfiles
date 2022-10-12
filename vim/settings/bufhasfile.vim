"   vi: foldmethod=marker tw=100
" fragments/settings/bufhasfile.vim @ (c) Leonardo Valeri Manera 2022

function! BufferHasFileCheck()
    if &buftype =~? 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    return 1
endfunction

