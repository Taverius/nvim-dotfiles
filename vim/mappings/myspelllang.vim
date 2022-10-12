"   vi: foldmethod=marker tw=100
" fragments/mappings/myspelllang.vim @ (c) Leonardo Valeri Manera 2022

let loaded_spellfile_plugin = 1
let g:my_lang_codes = [ 'en_gb', 'it', 'en_gb,it' ]
if !exists('g:MY_LANG_IDX') || ( g:MY_LANG_IDX + 1 < len(g:my_lang_codes) )
    let g:MY_LANG_IDX = 0
endif
function! NViMySpellLang()
    exec "setlocal" "spelllang=".get(g:my_lang_codes, g:MY_LANG_IDX)
    let g:MY_LANG_IDX = ( g:MY_LANG_IDX + 1 < len(g:my_lang_codes) ) ? g:MY_LANG_IDX + 1 : 0
endfunction

