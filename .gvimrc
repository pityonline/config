"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" No compatible
se nocp    " nocp = no compatible

" Encodings
se enc=utf-8   " enc = encoding
se fencs=ucs-bom,utf-8,cp936,gb18030,big5,latin1    " fenc = fileencodings

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc
autocmd! bufwritepost .vimrc call Pl#Load() " REQUIRED! 必须写在此，必须加叹号，否则 Powerline 在保存文件时会丢失颜色。

" Fast editing .vimrc
nm <leader>e :e ~/.gvimrc<cr>
" Fast saving
nm <leader>w :w!<cr>

" Set paste toggle key
se pt=<F10>  " pt = pastetoggle

" Auto change to current directory
se acd " acd = autochdir

filetype plugin indent on   " REQUIRED!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set font for Gui/MacVim
se gfn=Menlo\ for\ Powerline:h16   " gfn = guifont
" se gfn=Inconsolata-dz\ for\ Powerline:h16   " gfn = guifont

" Show line numbers
se nu  " nu = number

" Show relative numbers
se rnu  " rnu = relative number

" Show commands
se sc  " sc = show commands

" Show magic
se magic

" Dynamic title
se title

" Show ruler
se ru  " ru = ruler

" Show mode
se smd " smd = show mode

se wmnu    " wmnu s wildmenu

se bs=eol,start,indent " bs = backspace

" Colors
se bg=dark " bg = background
colo desert " colo = colorscheme

" Change the status line color
" http://vim.wikia.com/wiki/Change_statusline_color_to_show_insert_or_normal_mode
" Always show status bar
se ls=2  " ls is laststatus

" The following lines in vimrc will display the time of day and calender date on the editor status line
" http://vim.wikia.com/wiki/Display_date-and-time_on_status_line
" set ruf=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)  " ruf = rulerformat
" :h stl
" Powerline is better but no time or date items, disable the stl way.
" se stl=\ %<%F%1*%m%*%r%h\ %4{&encoding}\ %y%=\ %24(%{strftime('%a\ %b\ %e\ %I:%M')}%)\ %8(%l,%c%)\ %4(%P%) " stl = statusline
" se stl=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Highlight searching
se hls " hls = hlsearch

" Increase searching
se is  " is = incsearch

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自动缩进
se ai  " ai = autoindent
" 智能缩进
se si  " si = smartindent
" C/C++ 风格缩进
se cin " cin = cindent

" tab转化为4个字符
se et      " expandtab
se sta     " smarttab
se sw=4    " shiftwidth
se ts=4    " tabstop

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn enable
syn on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alias
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab itime <c-r>=strftime("%H:%M")<CR>
iab imail pityonline <pityonline@gmail.com>
iab igmail pityonline@gmail.com
iab """" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab #### #############################################################################
iab ==== =============================================================================
iab **** *****************************************************************************

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows Management
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nm wn <C-w>n
nm wv <C-w>v
nm wh <C-w>h
nm wj <C-w>j
nm wk <C-w>k
nm wl <C-w>l
nm wt <C-w>t
nm wb <C-w>b
nm wx <C-w>x
nm wH <C-w>H
nm wJ <C-w>J
nm wK <C-w>K
nm wL <C-w>L
nm wc <C-w>c<cr>
nm wo :vne<cr>

" 用c-j,k在buffer之间切换
nn <C-J> :bn<cr>
nn <C-K> :bp<cr>

" Set Up/Down non-linewise
no <Up> gk
no <Down> gj

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

no <silent> <leader>n :NERDTreeToggle<CR>

" Vimwiki
" from http://wiki.ktmud.com/tips/vim/vimwiki-guide.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 使用 <F4> 转换所有 wiki 为 html
map <F4> :VimwikiAll2HTML<cr>
" 使用 <leader> 来标记 todo状态
no <silent> <leader>x :VimwikiToggleListItem<cr>
" 是否在词条文件保存时就输出html  这个会让保存大词条比较慢
" 所以我默认没有启用  有需要的话就把这一行复制到下面去
"     \ 'auto_export': 1,

" 多个维基项目的配置
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
\ 'path_html': '~/Dropbox/vimwiki/html/',
\ 'html_header': '~/Dropbox/Public/vimwiki_template/header.htm',
\ 'html_footer': '~/Dropbox/Public/vimwiki_template/footer.htm',
\ 'syntax': 'markdown',
\ 'diary_link_count': 5}]
" \{'path': '~/Dropbox/vimwiki/'}
 
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case = 0
 
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
 
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''
 
" 是否开启按语法折叠  会让文件比较慢
" let g:vimwiki_folding = 1
 
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
" 是否去掉换行
let g:vimwiki_list_ignore_newline=0
" let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

" Calendar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

no <silent> <leader>c :Calendar<CR>

" Renamer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

no <silent> <leader>r :Renamer<cr>
no <silent> <leader>s :Ren<cr>

" Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set terminal color 256
se t_Co=256 " REQUIRED!

" Choose theme
" Should set gfn for Powerline, it's already set in Interface.
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'skwp'
let g:Powerline_cache_enabled = 0
" Solve Powerline color-lost after save a file.
" autocmd bufwritepost .vimrc call Pl#Load()  " REQUIRED! 这句必须写在 fast-saving 后面，写在这里不能生效。
" autocmd BufDelete * call Pl#Load()

" Taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nn <silent> <leader>t :TlistToggle<CR>
let Tlist_Ctags_Cmd = '/usr/local/Cellar/ctags/5.8/bin/ctags'
let Tlist_Use_Right_Window = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Auto_Open = 1
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Exit_OnlyWindow = 1
" let g:winManagerWindowLayout=’FileExplorer’

" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

no <silent> <leader>b :BundleInstall<cr>

" set nocompatible    " be iMproved
filetype off    " REQUIRED!
se rtp+=~/.vim/bundle/vundle/   " rtp = runtimepath
call vundle#rc()

" 使用Vundle来管理Vundle，这个必须要有。
Bundle 'gmarik/vundle'

" Colors

Bundle 'desert256.vim'
Bundle 'colorful256.vim'
Bundle 'darkburn'
Bundle '256-jungle'
Bundle 'Lucius'
Bundle 'lilydjwg_dark'
Bundle 'wombat256.vim'
Bundle 'altercation/vim-colors-solarized'
" colo wombat256mod

" se bg=dark  " bg = background
" let g:solarized_termcolors=256
" colo solarized

" Bundle 安装格式
" 格式1：Github上其他用户的仓库（非vim-scripts账户里的仓库，所以要加Github用户名）
" Bundle 'tpope/vim-rails.git'
" 格式2：vim-scripts里面的仓库，直接打仓库名即可。
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" 格式3：非Github的Git仓库
" Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'

Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
Bundle 'vimwiki'
Bundle 'renamer.vim'
Bundle 'mattn/calendar-vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'suan/vim-instant-markdown'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'

filetype plugin indent on   " REQUIRED!
