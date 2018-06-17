
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)
" let Vundle manage Vundle, required
Bundle 'tpope/vim-fugitive'
Bundle 'gmarik/vundle'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'marijnh/tern_for_vim'
Bundle 'digitaltoad/vim-jade'
Bundle 'bling/vim-airline'
Bundle 'morhetz/gruvbox'
Bundle 'Shougo/vimshell.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'Valloric/YouCompleteMe'
"Bundle 'davidhalter/jedi-vim'
"Bundle 'scrooloose/nerdtree'
"Bundle 'majutsushi/tagbar'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'genoma/vim-less'
Bundle 'skammer/vim-css-color'
Bundle 'JulesWang/css.vim'
Bundle 'tomasr/molokai'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'Blackrush/vim-gocode'
Bundle 'vim-scripts/Conque-GDB'
Bundle 'vim-scripts/octave.vim'
Bundle 'ayu-theme/ayu-vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'lervag/vimtex'
"Bundle 'jaredly/vim-debug'
filetype plugin indent on     " required
filetype plugin on
let ayucolor="dark"
"autocmd BufReadPost *.cpp,*.c,*.h,*.py,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
let g:ycm_path_to_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_server_use_vim_stdout = 1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_bold=1
let g:gruvbox_italic=0
let g:cpp_experimental_simple_template_highlight = 0
let g:cpp_concepts_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_member_variable_highlight = 1
"let g:cpp_class_scope_highlight = 1
"let g:cpp_experimental_template_highlight = 1
let g:cpp_class_scope_highlight = 1
set background=dark
set nocompatible              " be iMproved, required
filetype off                  " required
set mouse=a
set mousem=popup_setpos
set tabstop=2
set shiftwidth=2
set t_Co=256
set backspace=indent,eol,start
set laststatus=2 
set guifont=Inconsolata\ 11
set nowrap
set clipboard=unnamedplus
set fdm=indent
set foldlevel=20
set foldlevelstart=20
set guioptions-=T
nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>
imap <c-s> <Esc><c-s>
imap <c-j> <c-x><c-o>
imap <A-RIGHT> <Esc>:tabnext<CR>i
nmap <A-RIGHT> :tabnext<CR>
imap <A-LEFT> <Esc>:tabprev<CR>
nmap <A-LEFT> :tabprev<CR>
imap <A-S-LEFT> <C-W><C-H>
imap <A-S-RIGHT> <C-W><C-L>
nmap <A-S-LEFT> <C-W><C-H>
nmap <A-S-RIGHT> <C-W><C-L>
vmap <A-S-LEFT> <C-W><C-H>
vmap <A-S-RIGHT> <C-W><C-L>
noremap <F9> <Esc>:syntax sync fromstart<CR>
inoremap <F9> <C-o>:syntax sync fromstart<CR>
map <F7> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
noremap <F8> g:ConqueGdb_Leader . 'c'
noremap <F10> g:ConqueGdb_Leader . 'n'
noremap <F11> g:ConqueGdb_Leader . 's'
noremap <F6> g:ConqueGdb_Leader . 'b
noremap <F9> g:ConqueGdb_Leader . 'p'
inoremap <C-Z> <Esc>ui
augroup filetypedetect 
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave 
augroup END
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype octave if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
endif 
au BufNewFile,BufRead *.{cpp,h} set syntax=cpp11
au BufNewFile,BufRead *.pug set filetype=jade
"hi! Normal ctermbg=NONE
au BufNewFile,BufRead *.{css,scss,less} highlight! link cssBraces _Operator
au BufNewFile,BufRead *.{css,scss,less} highlight! link cssSelectorOp _Operator
if !has("gui_running")
    autocmd! VimEnter * :hi! Normal ctermbg=NONE
endif
color ayu
"color gruvbox
"color Tomorrow-Night-Eighties
        "\ [214,       'Orange1'],
        
let g:rbpt_colorpairs = [    
    \ [214,       'Orange1'],
    \ ['cyan',    'Cyan'],
        \ ['green',   'firebrick1'],
    \ ['darkred',     'SeaGreen1'],
    \ ['gray',        'RoyalBlue3'],
    \ ['magenta', 'Coral'],
    \ ['blue',    'Beige'],
        \ ['red',     'Lavender'],
    \ ['green',   'Yellow'],
        \ ['red',         'Orange1'],
    \ [086,    'Lime'],
    \ [099,       '#8787ff'],
    \ ['cyan',    'Cyan'],
        \ [214,       'Orange1']
    \ ]
let g:rbpt_max = 14
let g:rbpt_loadcmd_toggle = 0
hi link matlabArithmeticOperator _Operator
hi link matlabRelationalOperator _Operator
au VimEnter * RainbowParenthesesToggle
au BufRead,BufNewFile,BufEnter * RainbowParenthesesLoadRound
au BufRead,BufNewFile,BufEnter * RainbowParenthesesLoadSquare
set hlsearch
"au! BufWritePost *.go :edit!
"au BufRead,BufNewFile,BufEnter * RainbowParenthesesLoadChevrons
autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR
function TexFormat()
    set nu
    set wrap
    for i in split('abcdefghijklmnopqrstuvwxyz','\zs')
        execute printf("inoremap <Bslash>%s <Bslash>%s<c-x><c-o><c-p>",i,i)
    endfor
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
endfunction
au Bufread *.{tex} call TexFormat()
syntax on
hi link jsFuncCall Function
hi link jsOperator _Operator
hi link jsNoise _Operator
hi link matlabOperator _Operator
hi link goBlock _Operator
hi link goParen _Block
hi link _Operator Operator 
hi link _Block _Operator
hi link cCustomScope _Operator
hi link cCustomDot _Block
hi link cCustomPtr _Block
hi link AngleBracketContents _Operator
hi link cCustomAngleBrackets cType
"hi link Operator _Operator
"let g:rehash256=1
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-blockCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait7
set ruler
:set number


if !has("gui_running")
    hi! Normal ctermbg=NONE guibg=NONE
endif
