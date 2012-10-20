" A test for ln.
"
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

" Fast editing .vimrc
nm <leader>e :e ~/.vimrc<cr>
" Fast saving
nm <leader>w :w!<cr>

" Set paste toggle key
se pt=<F10>  " pt = pastetoggle

" Auto change to current directory
se acd " acd = autochdir

filetype plugin indent on   " REQUIRED

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set font for Gui/MacVim
se gfn=Menlo:h16   " gfn = guifont

" Show line numbers
se nu  " nu = number

" No line numbers
nm <leader>n :se nonu<cr>

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
color desert

" Always show status bar
" se ls=2  " ls is laststatus

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

syn on

" Markdown language syntax settings
augroup mkd
    autocmd BufRead *.mkd se ai formatoptions=tcroqn2 comments=n:>
augroup END

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

no <silent> <leader>t :NERDTreeToggle<CR>

" Vimwiki
" from http://wiki.ktmud.com/tips/vim/vimwiki-guide.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 使用 <F4> 转换所有 wiki 为 html
map <F4> :VimwikiAll2HTML<cr>
" 是否在词条文件保存时就输出html  这个会让保存大词条比较慢
" 所以我默认没有启用  有需要的话就把这一行复制到下面去
"     \ 'auto_export': 1,

" 多个维基项目的配置
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
\ 'path_html': '~/Dropbox/vimwiki/html/',
\ 'html_header': '~/Dropbox/Public/vimwiki_template/header.htm',
\ 'html_footer': '~/Dropbox/Public/vimwiki_template/footer.htm',
\ 'diary_link_count': 5},
\{'path': '~/Dropbox/vimwiki/'}]
 
" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
" let g:vimwiki_camel_case = 0
 
" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked = 1
 
" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu = ''
 
" 是否开启按语法折叠  会让文件比较慢
" let g:vimwiki_folding = 1
 
" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length = 1
 
" let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

" Calendar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

no <silent> <leader>c :Calendar<CR>

" Renamer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

no <silent> <leader>r :Renamer<cr>
no <silent> <leader>s :Ren<cr>
