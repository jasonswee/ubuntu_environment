set number              " show line numbers

set cursorline          " highlight current line

"filetype indent on      " load filetype-specific indent files

set encoding=utf-8
set wildmenu            " visual autocomplete for command menu
set clipboard=unnamed

set showmatch           " highlight matching parenthesis

set showcmd             " show command in bottom bar

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" configure expanding of tabs for various file types
au BufRead,BufNewFile *.py set expandtab
au BufRead,BufNewFile *.c set noexpandtab
au BufRead,BufNewFile *.h set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

"--------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
"--------------------------------------------------------------------------------
set expandtab           " enter spaces when tab is pressed
set textwidth=120       " break lines when line length increases
set tabstop=2           " use 4 spaces to represent tab
set softtabstop=2
"set shiftwidth=4        " number of spaces to use for auto indent
set autoindent          " copy indent from current line when starting a newline
set pastetoggle=<F3>

" make backspaces more powerfull
set backspace=indent,eol,start

set ruler                           " show line and column number
syntax on               " syntax highlighting
set showcmd             " show (partial) command in status line

autocmd BufWritePre * %s/\s\+$//e " strips trailing whitespace when :w is called
