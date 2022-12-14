"   vi: tw=100
" vim/plugins/vim-easy-align.vim @ (c) Leonardo Valeri Manera 2022

" custom patterns
let g:easy_align_delimiters = {
            \ '>': { 'pattern': '>>\|=>\|>' },
            \ '\': { 'pattern': '\\' },
            \ '/': {
            \     'pattern': '//\+\|/\*\|\*/',
            \     'delimiter_align': 'l',
            \     'ignore_groups': ['!Comment']
            \   },
            \ ']': {
            \     'pattern':       '\]\zs',
            \     'left_margin':   0,
            \     'right_margin':  1,
            \     'stick_to_left': 0
            \   },
            \ ')': {
            \     'pattern':       ')\zs',
            \     'left_margin':   0,
            \     'right_margin':  1,
            \     'stick_to_left': 0
            \   },
            \ 'f': {
            \     'pattern': ' \(\S\+(\)\@=',
            \     'left_margin': 0,
            \     'right_margin': 0
            \   },
            \ 'd': {
            \     'pattern': ' \ze\S\+\s*[;=]',
            \     'left_margin': 0,
            \ 'right_margin': 0
            \   },
            \ 'n' : {
            \     'pattern' : '\(\ =\|,\)',
            \     'left_margin' : 0,
            \     'mode_sequence' : 'lr*'
            \   }
            \ }

