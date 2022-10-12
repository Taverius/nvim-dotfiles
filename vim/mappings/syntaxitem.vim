"   vi: foldmethod=marker tw=100
" fragments/mappings/syntaxitem.vim @ (c) Leonardo Valeri Manera 2022

function! NViSyntaxItem()
    return join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), '/')
endfunction

