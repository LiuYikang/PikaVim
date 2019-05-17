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
" colorscheme desert_my
let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "NONE", "cterm16": "0"},
\}
set background=dark
packadd! onedark.vim
colorscheme onedark
"colorscheme one
"set background=dark

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
" [count]<leader>cc |NERDComComment|
" Comment out the current line or text selected in visual mode.
" [count]<leader>cn |NERDComNestedComment|
" Same as cc but forces nesting.
" [count]<leader>c<space> |NERDComToggleComment|
" Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.
" [count]<leader>cm |NERDComMinimalComment|
" Comments the given lines using only one set of multipart delimiters.
" [count]<leader>ci |NERDComInvertComment|
" Toggles the comment state of the selected line(s) individually.
" [count]<leader>cs |NERDComSexyComment|
" Comments out the selected lines with a pretty block formatted layout.
" [count]<leader>cy |NERDComYankComment|
" Same as cc except that the commented line(s) are yanked first.
" <leader>c$ |NERDComEOLComment|
" Comments the current line from the cursor to the end of line.
" <leader>cA |NERDComAppendComment|
" Adds comment delimiters to the end of line and goes into insert mode between them.
" |NERDComInsertComment|
" Adds comment delimiters at the current cursor position and inserts between. Disabled by default.
" <leader>ca |NERDComAltDelim|
" Switches to the alternative set of delimiters.
" [count]<leader>cl
" [count]<leader>cb |NERDComAlignedComment|
" Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).
" [count]<leader>cu |NERDComUncommentLine|
" Uncomments the selected line(s).

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
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1

let g:go_def_mode = 'gopls'

nmap <silent> <leader>gi :GoImports<cr>

map <c-i> :GoReferrers<cr>
" imap <C-Space> <C-x><C-o>

""""""""""""""""""""""""""""""
" set ycm
""""""""""""""""""""""""""""""
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
set completeopt=menu,menuone

noremap <c-z> <NOP>

let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }


