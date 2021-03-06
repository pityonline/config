" vim: set filetype=vim foldmethod=marker:

" General{{{

" No compatible
se nocp                 " nocp = no compatible

" Encodings
se enc=utf-8            " enc = encoding
se tenc=utf-8           " tenc = termencoding
se fenc=utf-8           " fenc =filencoding
se fencs=ucs-bom,utf-8,cp936,gb18030,big5,latin1    " fencs = fileencodings

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" When .vimrc is edited, reload it
au! bufwritepost .vimrc source $MYVIMRC
au! bufwritepost .vimrc call Pl#Load()  " REQUIRED! 必须写在此，必须加叹号，否则 Powerline 在保存文件时会丢失颜色。

" Fast editing .vimrc
nm <leader>e :e $MYVIMRC<cr>
" Fast saving
nm <leader>w :w!<cr>

" Set to <ESC>
ino jk <ESC>

" Set te to :tabe
nn te :tabe<Enter>

" yy copy to system clipboard
se cb=unnamed           " cb = clipboard

" Set auto-formating better for Chinese
se fo+=mM               " fo = formatoptions

" Set textwidth to 78 for text files
" au! bufNewFile,bufReadPost *.txt se tw=78   " tw = textwidth

" Map Q to gq
map Q gq

" Set SPACE to scroll down
nn <Space> <C-d>

" Set paste toggle key
se pt=<F10>             " pt = pastetoggle

" Auto change to current directory
se acd                  " acd = autochdir

" Chinese help language
se hlg=cn               " hlg = helplang

filetype plugin indent on   " REQUIRED!
"}}}

" Interface{{{

" Set font for Gui/MacVim
se gfn=Menlo\ for\ Powerline:h16    " gfn = guifont

" Show line numbers
se nu                   " nu = number

" Show commands
se sc                   " sc = show commands

" Show magic
se magic

" Dynamic title
se title

" Show ruler
se ru                   " ru = ruler

" Show column at line 80
se cc=80                " cc = colorcolumn

" Show mode
se smd                  " smd = show mode
se wmnu                 " wmnu = wildmenu

se bs=eol,start,indent  " bs = backspace

" linebreak
" not good for Chinese
se lbr

" Change the status line color
" http://vim.wikia.com/wiki/Change_statusline_color_to_show_insert_or_normal_mode
" Always show status bar
se ls=2                 " ls is laststatus

" 显示十六进制字符
:set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P

" The following lines in vimrc will display the time of day and calender date on the editor status line
" http://vim.wikia.com/wiki/Display_date-and-time_on_status_line
" set ruf=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)  " ruf = rulerformat
" :h stl
" Powerline is better but no time or date items, disable the stl way.
" se stl=\ %<%F%1*%m%*%r%h\ %4{&encoding}\ %y%=\ %24(%{strftime('%a\ %b\ %e\ %I:%M')}%)\ %8(%l,%c%)\ %4(%P%) " stl = statusline
" se stl=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Highlight searching
se hls                  " hls = hlsearch
hi Visual  guifg=#000000 guibg=#FFFFFF gui=none
" Increase searching
se is                   " is = incsearch
" Search show next match string at the center of screen
nn n nzz
nn N Nzz

" Show blank symbols when :se list
se lcs=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

se aw                   " autowrite
"}}}

" Indent & filetypes{{{

" 自动缩进
se ai                   " ai = autoindent
" 智能缩进
se si                   " si = smartindent
" C/C++ 风格缩进
se cin                  " cin = cindent

" 默认使用 4 空格缩进
se et                   " expandtab
se sta                  " smarttab
se sw=4                 " shiftwidth
se ts=4                 " tabstop
se sts=4                " softtabstop

" use speicified indent on different filetypes " why setlocal?
au FileType ruby        se et sw=2 ts=2 sts=2
au FileType html        se et sw=2 ts=2 sts=2
au FileType yaml,yml    se et sw=2 ts=2 sts=2
au BufEnter *.tmpl      se et sw=2 ts=2 sts=2

" do not expand tab in Makefiles
au FileType make,go             se noet

" fix crontab: temp file must be edited in place
autocmd Filetype crontab        setlocal nobackup nowritebackup
autocmd Filetype gitcommit      se spell textwidth=72

" use perl sytax highlight on Rexfile
au BufRead,BufWrite *Rexfile    se ft=perl

" Mermaid auto compile
" au BufEnter *.mmd,*.mermaid set Filetype mermaid bufwritepost !mermaid -p %
augroup mermaid
    " autocmd!  " Remove all vimrc autocommands
    au BufNewFile,BufRead *.mmd,*.mermaid se ft=mermaid
    au BufWritePost %!mermaid -p
augroup END

nm <leader>m :!mermaid -p %<Enter>

" auto remove trailing spaces when save
" https://unix.stackexchange.com/questions/75430/how-to-automatically-strip-trailing-spaces-on-save-in-vi-and-vim
autocmd BufWritePre * :%s/\s\+$//e

" auto remove blank lines at EOF when save
" https://stackoverflow.com/questions/7495932/how-can-i-trim-blank-lines-at-the-end-of-file-in-vim
autocmd BufWritePre * :%s#\($\n\s*\)\+\%$##e

" not for wiki
au BufNewFile,BufRead,BufEnter *.wiki :RainbowToggleOff
"}}}

" Syntax{{{

syn enable
syn on
"}}}

" Alias{{{

iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab itime <c-r>=strftime("%H:%M")<CR>
iab imail pityonline <pityonline@gmail.com>
iab igmail pityonline@gmail.com
iab idrop >/dev/null 2>&1
iab """"" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab ##### #############################################################################
iab ===== =============================================================================
iab ***** *****************************************************************************
"}}}

" Windows Management{{{

nn wn <C-w>n            " new split window vertical
nn wv <C-w>v            " copy horizontal
nn wh <C-w>h            " mv left
nn wj <C-w>j            " mv down
nn wk <C-w>k            " mv up
nn wl <C-w>l            " mv right
nn wt <C-w>t            " mv top
nn wb <C-w>b            " mv bottom
nn wT <C-w>T            " mv out to tab
nn wx <C-w>x            " exchange
nn wH <C-w>H            " turn vertical to horizontal then mv left
nn wJ <C-w>J            " turn horizontal to vertical then mv down
nn wK <C-w>K            " turn horizontal to vertical then mv up
nn wL <C-w>L            " turn vertical to horizontal then mv right
nn wc <C-w>c<cr>        " close window
nn wo :vne<cr>          " new split window horizontal

" Set Up/Down non-linewise
no <Up> gk
no <Down> gj
"}}}

" Functions{{{

" HelpHelper

""" flw 写的非常牛逼的 K 功能重载代码，可以在 vim 内部显示各种语言的帮助
""" gK 则在新标签页内打开帮助
function! HelpHelper( where )
    " 先拿下光标下的文字
    let l:word = expand( "<cWORD>" )

    " 再取出疑似函数名/模块名的部分和疑似方法的部分
    let l:lists = matchlist( l:word, "\\([_a-zA-Z0-9:]\\+\\)\\(->\\([_a-zA-Z0-9]\\+\\)\\)\\?" )

    let l:name = l:lists[1]
    let l:method = l:lists[3]

    let l:progList = []

    if &ft == "perl"
        if match( l:name, "::" ) != -1
            " 函数里是不可能有 :: 的，不用想了，一定是模块
            let l:progList += [ [ "perldoc -u ", "pod" ] ]
        elseif strlen( l:method )
            " 有方法的，一定是模块了
            let l:progList += [ [ "perldoc -u ", "pod" ] ]
        elseif match( l:name, "[A-Z]" ) != -1
            " 有大写字母，那一定是模块了，Perl buildin 函数的名称全都是小写字母的
            let l:progList += [ [ "perldoc -u ", "pod" ] ]
        else
            " 剩下的，有可能是函数，也有可能是模块，
            " 但是考虑到这样的模块较少，因此先优先查函数
            let l:progList += [ [ "perldoc -u -f ", "pod" ], [ "perldoc -u ", "pod" ] ]
        endif
    endif

    if &ft == "python"
         let l:progList += [ [ "python -c \"import sys; a = sys.argv[-1]; b = a.find('.') > -1 and 1 or 0; m = b == 1 and '.'.join(a.split('.')[:-1]) or a; exec( 'import '+m+';help('+a+')' )\" ", "man" ] ]
    endif

    if &ft == "erlang"
        if match( l:name, ":" ) != -1
            " erlang 的模块方法
            let l:lists = matchlist( l:name, "\\([_a-zA-Z0-9:]\\+\\):\\([_a-zA-Z0-9]\\+\\)" )
            let l:name = l:lists[1]
            let l:method = l:lists[2]
        endif
        let l:progList += [ [ "PAGER=\"col -b\" erl -man ", "man" ] ]
    endif

    let l:progList += [ [ "PAGER=\"col -b\" man 3 ", "man" ] ]
    let l:progList += [ [ "PAGER=\"col -b\" man 2 ", "man" ] ]
    let l:progList += [ [ "PAGER=\"col -b\" man ", "man" ] ]

    let l:found = 0
    " 下面调用外部命令，取帮助信息
    for l:prog in l:progList
        let l:progName = l:prog[0]
        let l:fileType = l:prog[1]
        let l:cmd = l:progName . l:name
        let l:lines = system( l:cmd )
        if !v:shell_error
            if a:where ==? "inNewTab"
                tabe [help]
            elseif a:where ==? "Vertical"
                rightbelow new [help]
            else
                above new [help]
            endif
            set buftype=nofile
            set ts=8
            execute "set ft=" . l:fileType
            call append( 0, split( l:lines, "\n" ) )
            normal gg
            if strlen(l:method)
                if l:fileType == "pod"
                    call search( "\\(=item\\d*\\s\\+\\)\\@<=" . l:method . "\\>" )
                elseif l:fileType == "man"
                    call search( "\\(^\\s\\+\\)\\@<=" . l:method . "\\>" )
                endif
            endif
            let l:found = 1
            break
        endif
    endfor

    if !l:found
        echohl ErrorMsg | echomsg "没有帮助信息。" | echohl None
    endif

endfunction

autocmd FileType c,perl,erlang,python nmap <silent> K :call HelpHelper( "" )<CR>
autocmd FileType c,perl,erlang,python nmap <silent> gK :call HelpHelper( "InNewTab" )<CR>
"}}}

" Plugins{{{

" rainbow{{{
let g:rainbow_active = 1"}}}

" NERDTree{{{2

no <silent> <leader>n :NERDTreeToggle<CR>
"}}}

" Vimwiki{{{2
" from http://wiki.ktmud.com/tips/vim/vimwiki-guide.html

" 使用 <F4> 转换所有 wiki 为 html
map <F4> :VimwikiAll2HTML<cr>
" 使用 <leader> 来标记 todo状态
no <silent> <leader>x :VimwikiToggleListItem<cr>
" 是否在词条文件保存时就输出html  这个会让保存大词条比较慢
" 所以我默认没有启用  有需要的话就把这一行复制到下面去
"     \ 'auto_export': 1,

" 多个维基项目的配置
"let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
"\ 'path_html': '~/Documents/vimwiki/html/',
"\ 'html_header': '~/Documents/vimwiki_template/header.htm',
"\ 'html_footer': '~/Documents/vimwiki_template/footer.htm'},
"\ {'path': '~/Documents/private/',
"\ 'path_html': '~/Documents/private/html/',
"\ 'diary_link_count': 5}]

" 使用第三方工具把 markdown 转为 html。
" \ 'custom_wiki2html': '/Users/pity/Repo/vimwiki_md2html/misaka_md2html.py',
" \ 'syntax': 'markdown',

let wiki                          = {}
let wiki.path                     = '~/Documents/vimwiki/'
let wiki.path_html                = '~/Documents/vimwiki/html/'
let wiki.template_path            = '~/Documents/templates/'
let wiki.template_default         = 'site'
let wiki.template_ext             = '.html'

let private                       = {}
let private.path                  = '~/Documents/private/'
let private.path_html             = '~/Documents/private/html/'
let private.template_path         = '~/Documents/templates/'
let private.template_default      = 'site'
let private.template_ext          = '.html'

let work                          = {}
let work.path                     = '~/Documents/work/'
let work.path_html                = 'html/'
let work.template_path            = 'templates/'
let work.template_default         = 'default'
let work.template_ext             = '.tpl'
let work.diary_rel_path           = './'
let work.auto_export              = 0

let g:vimwiki_list                = [wiki, work, private]

" 对中文用户来说，我们并不怎么需要驼峰英文成为维基词条
let g:vimwiki_camel_case          = 0

" 标记为完成的 checklist 项目会有特别的颜色
let g:vimwiki_hl_cb_checked       = 1

" 我的 vim 是没有菜单的，加一个 vimwiki 菜单项也没有意义
let g:vimwiki_menu                = ''

" 是否开启按语法折叠  会让文件比较慢
" let g:vimwiki_folding = 1

" 是否在计算字串长度时用特别考虑中文字符
let g:vimwiki_CJK_length          = 1

" 是否去掉换行
let g:vimwiki_list_ignore_newline = 0

" 在 vimwiki 里使用的 html 标签列表，以逗号分隔
let g:vimwiki_valid_html_tags     = 'b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'

" 对设置了的文件类型不进行扩展
let g:vimwiki_file_exts           = 'c, cpp, wav, txt, h, hpp, zip, sh, awk, ps, pdf'
"}}}

" Calendar{{{2

no <silent> <leader>c :Calendar<CR>
"}}}

" Renamer{{{2

no <silent> <leader>r :Renamer<cr>
no <silent> <leader>s :Ren<cr>
"}}}

" Powerline{{{2

" Set terminal color 256
se t_Co=256 " REQUIRED!

" Choose theme
" Should set gfn for Powerline, it's already set in Interface.
let g:Powerline_symbols       = 'fancy'
let g:Powerline_theme         = 'default'
let g:Powerline_colorscheme   = 'solarized256'
let g:Powerline_cache_enabled = 0

" Solve Powerline color-lost after save a file.
" au bufwritepost .vimrc call Pl#Load()  " REQUIRED! 这句必须写在 fast-saving 后面，写在这里不能生效。
" au BufDelete * call Pl#Load()
"}}}

" Taglist{{{2

" nn <silent> <leader>t :TlistToggle<CR>
let Tlist_Ctags_Cmd               = '`which ctags`'
let Tlist_Use_Right_Window        = 1
let Tlist_File_Fold_Auto_Close    = 1
let Tlist_Auto_Open               = 1
let Tlist_Show_One_File           = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_Exit_OnlyWindow         = 1

" update tags faster in insert mode
au CursorMovedI * silent! TlistHighlightTag

" vimwiki toc support
let Tlist_Vimwiki_Settings        = 'wiki;h:Headers'
"}}}

" Syntastic{{{2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0   " 不要每次都自动打开 quickfix，因为关不掉
let g:syntastic_check_on_open = 1

let g:syntastic_go_checkers = ['gometalinter']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=vet', '--enable=golint']

" 忽略一些文件类型的检查，如某个目录中的文件，或以某种扩展名结尾的文件
" let g:syntastic_ignore_files = ['\m^/usr/include/', '\m\c\.xml']

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": [],
    \ "passive_filetypes": ["xml"]
    \}

" shell
let g:syntastic_sh_shellcheck_args = "-e SC1117"

" python
let g:syntastic_python_checkers = ['flake8', 'pylint']
" let g:syntastic_python_pylint_args="-d msg1,msg2"
let g:syntastic_python_flake8_args='--ignore=E302,E305,E501'
"}}}

" easymotion{{{2

let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
"}}}

" SQL Server format{{{2

let g:sqlutil_keyword_case   = '\U'
let g:sqlutil_cmd_terminator = "\ngo"
"}}}

" previm{{{2

let g:previm_open_cmd = 'open -a Safari'
"}}}

" vim-go{{{2

let g:go_list_type                   = "quickfix"
let g:go_fmt_autosave                = 1
let g:go_fmt_command                 = "goimports"
let g:go_test_timeout                = '10s'    " default to 10 seconds

" highlight
let g:go_highlight_types             = 1
let g:go_highlight_fields            = 1
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_operators         = 1
let g:go_highlight_extra_types       = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags     = 1

" metalinter
let g:go_metalinter_enabled          = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave         = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline         = "5s"

let g:go_auto_type_info              = 1
let g:go_auto_sameids                = 1

autocmd FileType go nmap <leader>B  <Plug>(go-build)
autocmd FileType go nmap <leader>R  <Plug>(go-run)
autocmd FileType go nmap <leader>T  <Plug>(go-test)
autocmd FileType go nmap <Leader>C  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i  <Plug>(go-info)

autocmd Filetype go command! -bang A  call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
"}}}

" tagbar{{{2

nn <silent> <leader>t :TagbarToggle<CR>
" au VimEnter * nested :TagbarOpen

" gotags

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
"}}}

" vim-easy-align{{{2

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}

" mkdx.vim{{{2

" :h mkdx-var-map-prefix
let g:mkdx#map_prefix = '\'

" :h mkdx-var-map-keys
let g:mkdx#map_keys = 1

" :h mkdx-var-checkbox-toggles
let g:mkdx#checkbox_toggles = [' ', '-', 'x']

" :h mkdx-var-checklist-update-tree
let g:mkdx#checklist_update_tree = 2

" :h mkdx-var-restore-visual
let g:mkdx#restore_visual = 1

" :h mkdx-var-header-style
let g:mkdx#header_style = '#'

" :h mkdx-var-table-header-divider
let g:mkdx#table_header_divider = '-'

" :h mkdx-var-table-divider
let g:mkdx#table_divider = '|'

" :h mkdx-var-enhance-enter
let g:mkdx#enhance_enter = 1

" :h mkdx-var-list-tokens
let g:mkdx#list_tokens = ['-', '*', '>']

" :h mkdx-var-fence-style
let g:mkdx#fence_style = ''

" :h mkdx-var-toc-text
let g:mkdx#toc_text = 'TOC'

" :h mkdx-var-toc-list-token
let g:mkdx#toc_list_token = '-'

" :h mkdx-var-link-as-img-pat
let g:mkdx#link_as_img_pat = 'a\?png\|jpe\?g\|gif'
"}}}

" LanguageTool{{{2

let g:languagetool_jar='/usr/local/Cellar/languagetool/4.1/libexec/languagetool-commandline.jar'
let g:languagetool_lang='en'
"}}}

" CtrlP{{{2

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }
"}}}

" YouCompleteMe{{{2

set completeopt=longest,menu
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"}}}

" editorconfig{{{2
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']"}}}

" vim-markdown{{{
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_frontmatter = 1"}}}

"}}}

" Vundle.vim{{{

no <silent> <leader>b :PluginInstall<cr>

filetype off            " REQUIRED!
se rtp+=~/.vim/bundle/Vundle.vim/   " rtp = runtimepath
call vundle#begin()

" 使用 Vundle 来管理 Vundle，这个必须要有。
Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'The-NERD-tree'
Plugin 'tagbar'
Plugin 'vimwiki/vimwiki'
Plugin 'renamer.vim'
Plugin 'mattn/calendar-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'vim-syntastic/syntastic'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'Perldoc.vim'
Plugin 'wikipedia.vim'
Plugin 'SQLUtilities'
Plugin 'dbext.vim'
Plugin 'kannokanno/previm'
Plugin 'fatih/vim-go'
Plugin 'pylint.vim'
Plugin 'Windows-PowerShell-Syntax-Plugin'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'SirVer/ultisnips'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'vim-flake8'
Plugin 'junegunn/vim-easy-align'
Plugin 'SidOfc/mkdx'
Plugin 'eraserhd/vim-ios'
Plugin 'cocoa.vim'
Plugin 'enricobacis/paste.vim'
Plugin 'ack.vim'
Plugin 'LanguageTool'
Plugin 'Valloric/YouCompleteMe'
Plugin 'VincentCordobes/vim-translate'
Plugin 'luochen1990/rainbow'

call vundle#end()
filetype plugin indent on   " REQUIRED!
"}}}

" Solarrized{{{

se bg=dark  " bg = background
let g:solarized_termcolors=256
let g:solarized_hitrail=1       " 未生效
colo solarized"}}}
