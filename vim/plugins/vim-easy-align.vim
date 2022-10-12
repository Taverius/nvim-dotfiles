"   vi: foldmethod=marker tw=100
" plugins/vim-easy-align.vim @ (c) Leonardo Valeri Manera 2022

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
xmap <Silent> ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Silent> ga <Plug>(EasyAlign)
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

