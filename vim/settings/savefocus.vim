"   vi: foldmethod=marker tw=100
" fragments/settings/savefocus.vim @ (c) Leonardo Valeri Manera 2022

augroup nviSaveOnFocusLost
    autocmd!
    autocmd FocusLost * silent! :wall
augroup END

