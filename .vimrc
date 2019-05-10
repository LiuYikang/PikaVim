"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim origin config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get out of VI's compatible mode..
set nocompatible

"Sets how many lines of history VIM har to remember
set history=400

"set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,sjis,euc-kr,ucs-2le,latin1
" CJK environment detection and corresponding setting
if v:lang =~ "^zh_CN"
  " Use cp936 to support GBK, euc-cn == gb2312
  set encoding=chinese
  set termencoding=chinese
  set fileencoding=chinese
elseif v:lang =~ "^zh_TW"
  " cp950, big5 or euc-tw
  " Are they equal to each other?
  set encoding=taiwan
  set termencoding=taiwan
  set fileencoding=taiwan
elseif v:lang =~ "^ko"
  "  " Copied from someone's dotfile, untested
  set encoding=euc-kr
  set termencoding=euc-kr
  set fileencoding=euc-kr
elseif v:lang =~ "^ja_JP"
" Copied from someone's dotfile, untested
set encoding=euc-jp
set termencoding=euc-jp
set fileencoding=euc-jp
endif
" Detect UTF-8 locale, and replace CJK setting if needed
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
endif

"Enable filetype plugin
filetype plugin on
filetype indent on

"Set to auto read when a file is changed from the outside
set autoread

"Show line number
set nu

"Include search
set incsearch

"Highlight search things
set hlsearch

"Set magic on
set magic


""""""""""""""""""""""""""""""
" Colors and Fonts
""""""""""""""""""""""""""""""
syntax enable
colorscheme desert_my
"packadd! onedark.vim
"colorscheme onedark

""""""""""""""""""""""""""""""
" Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

function! CurDir()
   let curdir = substitute(getcwd(), '/home/easwy/', "~/", "g") 
   return curdir
endfunction

""""""""""""""""""""""""""""""
" Text options
""""""""""""""""""""""""""""""
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab

""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

""Smart indet
set si

""C-style indeting
set cindent

""Wrap lines
set wrap

"Set mapleader
let mapleader = ","
let g:mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""
" NERDree config
""""""""""""""""""""""""""""""""
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

nmap <silent> <leader>tt :NERDTreeToggle<cr>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

""""""""""""""""""""""""""""""
" Tagbar setting
""""""""""""""""""""""""""""""
let g:tagbar_width = 40
let g:tagbar_expand = 1
let g:tagbar_autopreview = 1
nmap <silent> <Leader>bb :TagbarToggle<cr>

"""""""""""""""""""""""""""""
" delimitMate setting
"""""""""""""""""""""""""""""
let g:delimitMate_autoclose = 1
let g:delimitMate_matchpairs = "(:),[:],{:},<:>"
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1

"""""""""""""""""""""""""""""
" NERDCommenter setting
"""""""""""""""""""""""""""""
let g:NERDSpaceDelims=1

"""""""""""""""""""""""""""""
" ctrlp setting
"""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
" 默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 1
" 默认不使用正则表达式，置1改为默认使用正则表达式，可以用<C-r>进行切换
let g:ctrlp_regexp = 1

""""""""""""""""""""""""""""""
" bufexplorer setting
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=1       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 35  " Split width
let g:bufExplorerUseCurrentWindow=1  " Open in new window.
let g:bufExplorerMaxHeight=25        " Max height

""""""""""""""""""""""""""""""
" taglist setting
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/home/lyk/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
nmap <silent> <leader>tl :Tlist<cr>

""""""""""""""""""""""""""""""
" winmanager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer,FileExplorer|TagList"
let g:winManagerWidth = 35 
let g:defaultExplorer = 0
nmap <C-W><C-F> :FirstExplorerWindow<cr>
nmap <C-W><C-B> :BottomExplorerWindow<cr>
nmap <silent> <leader>wm :WMToggle<cr>
autocmd BufWinEnter \[Buf\ List\] setl nonumber

""""""""""""""""""""""""""""""
" set ctrlsf
""""""""""""""""""""""""""""""
let g:ctrlsf_default_view_mode = 'compact'
map <c-f> :CtrlSF<space>

""""""""""""""""""""""""""""""
" set vim-go
""""""""""""""""""""""""""""""
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
map <c-i> :GoReferrers<cr>
