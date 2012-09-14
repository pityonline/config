""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""

" No compatible
set nocp

" Encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1

" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line numbers
set nu

" No line numbers
nmap <leader>n :set nonu<cr>

" Show commands
set sc

" Show magic
set magic

" Dynamic title
set title

" Show ruler
set ru

" Show mode
set smd

set wildmenu

set backspace=eol,start,indent

filetype on

" Colors
set background=dark
colorscheme desert

" Always show status bar 
" set laststatus=2

" Highlight searching
set hls

" Increase searching
set incsearch

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""

" 自动缩进
set ai
" 智能缩进
set si
" C/C++ 风格缩进
set cindent

" tab转化为4个字符
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""
" Alias
""""""""""""""""""""""""""""""""""""""""""""""""""

iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab itime <c-r>=strftime("%H:%M")<CR>
iab imail pityonline <pityonline@gmail.com>
iab igmail pityonline@gmail.com
iab """" """"""""""""""""""""""""""""""""""""""""""""""""""
iab #### ##################################################

""""""""""""""""""""""""""""""""""""""""""""""""""
" Window Movement
""""""""""""""""""""""""""""""""""""""""""""""""""

nmap wn <C-w>n
nmap wv <C-w>v
nmap wh <C-w>h
nmap wj <C-w>j
nmap wk <C-w>k
nmap wl <C-w>l

" 用c-j,k在buffer之间切换
nn <C-J> :bn<cr>
nn <C-K> :bp<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
noremap <silent> <leader>t :NERDTreeToggle<CR>

filetype plugin indent on  
