"   vi: foldmethod=marker tw=100
" fragments/settings/undofile.vim @ (c) Leonardo Valeri Manera 2022

augroup nviUndoFile
    autocmd!
    " Only set undofile for buffers backed by a file
    autocmd BufWritePost ?* if !BufferHasFileCheck() | setlocal noundofile | endif
    autocmd BufWinEnter  ?* if !BufferHasFileCheck() | setlocal noundofile | endif
augroup END

