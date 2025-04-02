"   vi: tw=100
" ginit.vim @ (c) Leonardo Valeri Manera 2022

set guioptions-=Te      " Remove the toolbar and gui tab-bar
" set guioptions+=d       " Dark mode

" Set window size
set lines=999
set columns=130

" Ctrl-ScrollWheel for zooming in/out
nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>

" CaskaydiaCove, honestly the cleanest of the lot
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

if exists("g:neovide")
    " We're in Neovide
    set guifont=VictorMono_Nerd_Font:h13:#e-subpixelantialias

    " Zoom in/out with scale with [Ctrl -] and [Ctrl =]
    let g:neovide_scale_factor=1.0
    function! ChangeScaleFactor(delta)
        let g:neovide_scale_factor = g:neovide_scale_factor * a:delta
    endfunction
    nnoremap <expr><C-=> ChangeScaleFactor(1.25)
    nnoremap <expr><C--> ChangeScaleFactor(1/1.25)

    " If the mouse is on the window, hide it while typing
    let g:neovide_hide_mouse_when_typing = v:true

    " Save and restore the window size
    let g:neovide_remember_window_size = v:true

    " Low refresh rate when idle
    let g:neovide_refresh_rate_idle = 5
elseif exists('g:fvim_loaded')
    " We're in FVim
    set guifont=VictorMono\ Nerd\ Font:h16

    nnoremap <A-CR> :FVimToggleFullScreen<CR>

    " Fancy cursor
    FVimCursorSmoothMove v:true
    FVimCursorSmoothBlink v:true

    " Title bar tweaks
    FVimCustomTitleBar v:true

    " Font stuff
    FVimFontAntialias v:true
    FVimFontAutohint v:true
    FVimFontHintLevel 'full'
    FVimFontLigature v:true
    FVimFontSubpixel v:true

    " Disable built-in NerfFont glyphs
    FVimFontNoBuiltinSymbols v:true

    " Automatic input method engagement in Insert mode
    FVimKeyAutoIme v:true

    " Default options (workspace-agnostic)
    FVimDefaultWindowWidth 1300
    FVimDefaultWindowHeight 1400
elseif exists('g:goneovim')
    " We're in Goneovim
else
    " Assume nvim-qt

    " Set the font
    if exists(':GuiFont')
        Guifont! VictorMono\ NF:h13
    endif

    " Set UI to adaptive
    if exists(':GuiAdaptiveColor')
        GuiAdaptiveColor 1
    endif
    if exists(':GuiAdaptiveStyle')
        GuiAdaptiveStyle 1
    endif

    " Enable font ligatures
    if exists(':GuiRenderLigatures')
        GuiRenderLigatures 1
    endif

    " Use text popup menu
    if exists(':GuiPopupmenu')
        GuiPopupmenu 0
    endif

    " Use the text tabline
    if exists(':GuiTabline')
        GuiTabline 0
    endif

    " Remove the how to remove mouse menu lines
    aunmenu PopUp.How-to\ disable\ mouse
    aunmenu PopUp.-1-

endif

