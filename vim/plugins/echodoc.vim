"   vi: tw=100
" vim/plugins/echodoc.vim @ (c) Leonardo Valeri Manera 2022

let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'

augroup vimrcEchodocHighlight
    autocmd!
    autocmd ColorScheme * highlight clear EchoDocPopup
    autocmd ColorScheme * highlight! link EchoDocPopup        Pmenu
augroup END

