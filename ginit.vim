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

" Set the font
" CaskayudiaCove, honestly the cleanest of the lot
" set guifont=CaskaydiaCove_NF:h13:W300
" Consolas, self-patched with -w -s -c, glyphs are a little off
" set guifont=Consolas_NF:h14
" FantasqueSansMono, hilarious flair and still plenty readable
" set guifont=FantasqueSansMono_NF:h14
" JetBrainsMono, I find the serifs a bit too square
" set guifont=JetBrainsMono_NF:h13:W300
" Hasklug, clean with great ligatures
" set guifont=Hasklug_NF:h13
" Iosevka is a little laterally compressed for my tastes
" set guifont=Iosevka:h14
" VictorMono, cursive lowercase italic!
" set guifont=VictorMono_NF:h13
if has('windows')
    " We can fall back onto Cascadia Code and Consolas
    set guifont=VictorMono_NF:h13,FantasqueSansMono_NF:h14,CaskaydiaCove_NF:h13:W300,Cascadia_Code_PL:h13:W300,Consolas:h14
else
    set guifont=Hack,Fira\ Code,Droid\ Sans\ Mono:h14
endif

if exists("g:neovide")
    " Zoom in/out with scale with [Ctrl -] and [Ctrl =]
    let g:neovide_scale_factor=1.0
    function! ChangeScaleFactor(delta)
        let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
    endfunction
    nnoremap <expr><C-=> ChangeScaleFactor(1.25)
    nnoremap <expr><C--> ChangeScaleFactor(1/1.25)

    " If the mouse is on the window, hide it while typing
    let g:neovide_hide_mouse_when_typing = v:true

    " Loww refresh rate when idle
    let g:neovide_refresh_rate_idle = 5
endif

if exists('g:fvim_loaded')
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
