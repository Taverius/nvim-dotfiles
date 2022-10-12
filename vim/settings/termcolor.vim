"   vi: foldmethod=marker tw=100
" fragments/settings/termcolor.vim @ (c) Leonardo Valeri Manera 2022

function! TerminalTrueColorCheck()
    if $TERM =~ '^\(rxvt\|screen\|interix\|putty\|win32con\)\(-.*\)\?$'
        set notermguicolors
    elseif $TERM =~ '^\(tmux\|iterm\|vte\|gnome\|vtpcon\|conemu\)\(-.*\)\?$'
        set termguicolors
    elseif $TERM =~ '^\(xterm\)\(-.*\)\?$'
        if $XTERM_VERSION != ''
            set termguicolors
        elseif $KONSOLE_PROFILE_NAME != ''
            set termguicolors
        elseif $VTE_VERSION != ''
            set termguicolors
        else
            set notermguicolors
        endif
    endif
endfunction
augroup nviTerminalColors
    autocmd!
    autocmd UIEnter * call TerminalTrueColorCheck()
augroup END

