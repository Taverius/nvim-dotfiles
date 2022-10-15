"   vi: tw=100
" vim/plugins/asyncomplete.vim @ (c) Leonardo Valeri Manera 2022

if !has('python3')
    " Maps
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

    " Sources
    augroup vimrcAsyncCompleteSources
        autocmd!
        autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
                    \ 'name': 'buffer',
                    \ 'whitelist': ['*'],
                    \ 'blacklist': ['go'],
                    \ 'completor': function('asyncomplete#sources#buffer#completor'),
                    \ 'config': {
                    \    'max_buffer_size': 5000000,
                    \  },
                    \ }))
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
                    \ 'name': 'tags',
                    \ 'whitelist': ['*'],
                    \ 'completor': function('asyncomplete#sources#tags#completor'),
                    \ 'config': {
                    \    'max_buffer_size': 5000000,
                    \  },
                    \ }))
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
                    \ 'name': 'file',
                    \ 'whitelist': ['*'],
                    \ 'priority': 10,
                    \ 'completor': function('asyncomplete#sources#file#completor'),
                    \ }))
        autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                    \ 'name': 'omni',
                    \ 'allowlist': ['*'],
                    \ 'blocklist': ['c', 'cpp', 'html', 'rb'],
                    \ 'completor': function('asyncomplete#sources#omni#completor'),
                    \ 'config': {
                    \   'show_source_kind': 1,
                    \  },
                    \ }))
    augroup END
endif

