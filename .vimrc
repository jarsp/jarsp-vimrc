" Vimrc!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug stuff                                             VUN00
call plug#begin('~/.config/nvim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/colorsupport.vim'
Plug 'beyondmarc/glsl.vim', { 'for': 'glsl' }
Plug 'xolox/vim-session' | Plug 'xolox/vim-misc'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'nathanaelkane/vim-indent-guides'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'Valloric/vim-operator-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'joom/latex-unicoder.vim'
Plug 'majutsushi/tagbar'
Plug 'jarsp/cornell.vim'
Plug 'jarsp/NERV-ous'
Plug 'jarsp/tex.vim'

call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YCM and some autocomplete configuration                    YCM00
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_global_ycm_extra_conf='/home/jarsp/.vim/ycm_extra_conf_def.py'
let g:clang_complete_macros=1
" Use neco-ghc for haskell completion
let g:haskellmode_completion_ghc=0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
let g:necoghc_enable_detailed_browse=1
let g:ycm_semantic_triggers = {'haskell' : ['re![a-zA-Z_\.]']}
set pumheight=8
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips trigger configuration                            SNP00
let g:UltiSnipsExpandTrigger='<c-e>'
let g:UltiSnipsJumpForwardTrigger='<c-j>'
let g:UltiSnipsJumpBackwardsTrigger='<c-k>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar configuration                                       TAG00
noremap <F9> :TagbarToggle<CR>
inoremap <F9> :TagbarToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Session configuration                                  SES00
let g:session_autosave='no'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" haskell-vim configuration                                  HSK00
let g:haskell_indent_if=3
let g:haskell_indent_case=2
let g:haskell_indent_let=4
let g:haskell_indent_where=6
let g:haskell_indent_do=3
let g:haskell_indent_in=1
let g:haskell_indent_guard=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF                                                        FZF00
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }
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
let mapleader=' '
inoremap jk <Esc>
" Must alias vim to stty stop '' ixoff; vim in bash
noremap <c-s> <Esc>:w<CR>
inoremap <c-s> <Esc>:w<CR>
noremap <c-q> <Esc>:q<CR>
inoremap <c-q> <Esc>:q<CR>
noremap <leader>m <Esc>:make!<CR>
" Temporary hack because suddenly C-space doesnt seem to trigger
" YCM properly in i3wm at least
" Works so far in Linux Mint so I'm disabling this
" inoremap <leader>; <Esc>F:xhxA
" Close preview window attached to current window
inoremap jh <Esc>:ResetAfterPreviewWindowClose<CR>a
inoremap jn <CR>
noremap bn <Esc>:bp<CR>
noremap bm <Esc>:bn<CR>
nnoremap <Esc> <Esc>:noh<CR>
tnoremap <Esc> <C-\><C-n>
" Splits and stuff
noremap <leader>sh <Esc>:abo vsp<CR>
noremap <leader>sj <Esc>:bel sp<CR>
noremap <leader>sk <Esc>:sp<CR>
noremap <leader>sl <Esc>:vsp<CR>
noremap <leader>eh <Esc>:abo vsp<CR>:Explore<CR>
noremap <leader>ej <Esc>:bel sp<CR>:Explore<CR>
noremap <leader>ek <Esc>:sp<CR>:Explore<CR>
noremap <leader>el <Esc>:vsp<CR>:Explore<CR>
noremap <leader>wf <Esc>:tabf 
noremap <leader>wh <Esc>:tabp<CR>
noremap <leader>wl <Esc>:tabn<CR>
" Not vim compatible
noremap <leader>rh <Esc>:abo vsp<CR>:term<CR>
noremap <leader>rj <Esc>:bel sp<CR>:term<CR>
noremap <leader>rk <Esc>:sp<CR>:term<CR>
noremap <leader>rl <Esc>:vsp<CR>:term<CR>
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
