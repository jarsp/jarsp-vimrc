" Contents:
" VUN00 - Vundle setup
" YCM00 - You Complete Me settings
" SNP00 - UltiSnips settings
" GSL00 - glsl.vim settings
" THM00 - Theme settings
" KEY00 - Keymappings
" MSC00 - Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle stuff                                               VUN00
set nocp
filetype off

" Set runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-scripts/colorsupport.vim'
Plugin 'beyondmarc/glsl.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Valloric/vim-operator-highlight'
Plugin 'jiangmiao/auto-pairs'
Plugin 'joom/latex-unicoder.vim'
Plugin 'jarsp/cornell.vim'
Plugin 'jarsp/tex.vim'

call vundle#end()

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM and some autocomplete configuration                    YCM00
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_global_ycm_extra_conf='/home/jarsp/.vim/ycm_extra_conf_def.py'
let g:clang_complete_macros=1
set pumheight=8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips trigger configuration                            SNP00
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardsTrigger='<c-k>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto-Pair configuration                                    ATP00
"let g:AutoPairsShortcutToggle='<c-p>'
let g:AutoPairsShortcutFastWrap='qd'
let g:AutoPairsShortcutJump='<c-n>'
"let g:AutoPairsShortcutBackInsert='<M-b>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" glsl.vim syntax highlighting settings                      GSL00
let g:glsl_default_version='glsl330'
let g:glsl_file_extensions='*.glsl,*.vsh,*.fsh,*.frag,*.vert'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default syntax highlighting, when available                SYN00
syntax on
" Tabs and stuff
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set foldmethod=manual
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex conceal stuff                                        LTX00
set cole=2
"set ambw=double
let g:tex_conceal="adgms"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Latex unicoder plugin                                      LTX01
let g:unicoder_cancel_normal=1
let g:unicoder_cancel_insert=1
let g:unicoder_cancel_visual=1
nnoremap <C-l> :call unicoder#start(0)<CR>
inoremap <C-l> <Esc>:call unicoder#start(1)<CR>
vnoremap <C-l> :<C-u>call unicoder#selection()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font and colors                                            THM00
" These lines have to come after "syntax on"
color jarsp-nerv-ous
hi Normal ctermbg=none
hi Nontext ctermbg=none
" For vim-airline
set laststatus=2
let g:airline_theme='base16_default'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
" Line numbers and other bits
set number
set cc=80
" Indent highlighting
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_exclude_filetypes=['help', 'cornell']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
" Operator highlighting
let g:ophigh_color=33
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenience key bindings                                   KEY00
inoremap jk <Esc>
" Must alias vim to stty stop '' ixoff; vim in bash
noremap <c-s> <Esc>:w<CR>
inoremap <c-s> <Esc>:w<CR>
noremap <c-q> <Esc>:q<CR>
inoremap <c-q> <Esc>:q<CR>
noremap <leader>m <Esc>:make!<CR>
inoremap <leader>m <Esc>:make!<CR>
" Temporary hack because suddenly C-space doesnt seem to trigger
" YCM properly in i3wm at least
" Works so far in Linux Mint so I'm disabling this
" inoremap <leader>; <Esc>F:xhxA
" Close preview window attached to current window
inoremap jh <Esc>:ResetAfterPreviewWindowClose<CR>a
inoremap jn <CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous things                                       MSC00
set splitright
set title
command ResetAfterPreviewWindowClose call s:ResetAfterPreviewWindowClose()
" Must make sure this is not affected by keybindings I guess
function! s:ResetAfterPreviewWindowClose()
    let l:currHeight=winheight(0)
    :wincmd k
    if getwinvar(0, '&pvw')==1
        let l:currHeight+=winheight(0)+1
        :q
        :exec ':res '.l:currHeight 
    else
        :wincmd j
    endif
endfunction
" Make backspace work properly
set backspace=indent,eol,start
