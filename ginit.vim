"   vi: foldmethod=marker
" init.vim @ (c) Leonardo Valeri Manera 2022

set guioptions-=Te      " Remove the toolbar and gui tab-bar
set guioptions+=d       " Dark mode

" Set window size
set lines=999
set columns=130

" Ctrl-ScrollWheel for zooming in/out
nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>

if exists("g:neovide")
    if has('windows')
        set guifont=Consolas,Cascadia\ Mono,Cascadia\ Mono\ PL:h14
    else
        set guifont=Hack,Fira\ Code,Droid\ Sans\ Mono:h14
    endif

    " Zoom in/out with scale with <Ctrl -> and <Ctrl =>
    let g:neovide_scale_factor=1.0
    function! ChangeScaleFactor(delta)
        let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
    endfunction
    nnoremap <expr><C-=> ChangeScaleFactor(1.25)
    nnoremap <expr><C--> ChangeScaleFactor(1/1.25)

    " If the mouse is on the window, hide it while typing
    let g:neovide_hide_mouse_when_typing = v:false

    " Loww refresh rate when idle
    let g:neovide_refresh_rate_idle = 5
endif

if exists('g:fvim_loaded')
    " good old 'set guifont' compatibility with HiDPI hints...
    if g:fvim_os == 'windows'
        set guifont=Consolas:h16
    elseif g:fvim_render_scale > 1.0
        set guifont=Hack:h12
    else
        set guifont=Hack:h24
    endif

    nnoremap <A-CR> :FVimToggleFullScreen<CR>

    " Fancy cursor
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true

    " Font stuff
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontHintLevel 'full'
    FVimFontLigature v:true
    FVimFontSubpixel v:true

    " Automatic input method engagement in Insert mode
    FVimKeyAutoIme v:true

    " Don't use the UI Popups
    FVimUIPopupMenu v:false
    FVimUIWildMenu v:false
endif
