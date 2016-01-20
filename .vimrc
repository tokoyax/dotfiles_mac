set modeline
set modelines=3
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0

" neobundle settings {{{

if has('vim_starting')
  set nocompatible
    " neobundle をインストールしていない場合は自動インストール
    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
      echo "install neobundle..."
      " vim からコマンド呼び出しているだけ neobundle.vim のクローン
      :call system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'nanotech/jellybeans.vim'

" vimfiler {{{
NeoBundle 'Shougo/vimfiler.vim'
let g:vimfiler_as_default_explorer = 1
nnoremap <Space>e :VimFilerExplore -split -winwidth=30 -find -no-quit<Cr>
" }}}

" unite {{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_winwidth = 30
nnoremap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>uo :<C-u>Unite outline<CR>
nnoremap <silent> <Space>um :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> <Space>ug :<C-u>Unite vimgrep<CR>
nnoremap <silent> <Space>uy :<C-u>Unite history/yank<CR>

" rails の設定   
nnoremap <silent> <Space>urc :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap <silent> <Space>urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> <Space>urm :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> <Space>urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> <Space>urv :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> <Space>urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> <Space>urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> <Space>urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> <Space>urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> <Space>urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> <Space>uro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> <Space>urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> <Space>url :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> <Space>urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> <Space>urr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> <Space>urfr :<C-u>Unite file file/new -input=spec/ <CR>
" }}} unite

"neocomplete {{{
NeoBundle 'Shougo/neocomplete.vim'
 
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
 
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
                        \ 'default' : '',
                        \ 'vimshell' : $HOME.'/.vimshell_hist',
                        \ 'scheme' : $HOME.'/.gosh_completions'
                        \ }
 
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
 
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
 
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
        return neocomplete#close_popup() . "\<CR>"
        " For no inserting <CR> key.
        "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
 
" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1
 
" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1
 
" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
 
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"}}}

" neosnippet {{{
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"}}}

" vimproc {{{
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
" }}}

" ctrlp.vim {{{
NeoBundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" }}}

" auto-ctags {{{
NeoBundle 'soramugi/auto-ctags.vim'
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
" }}}

" yankround.vim {{{
"NeoBundle 'LeafCage/yankround.vim'
"nmap p <Plug>(yankround-p)
"nmap P <Plug>(yankround-P)
"nmap <C-p> <Plug>(yankround-prev)
"nmap <C-n> <Plug>(yankround-next)
"let g:yankround_max_history = 100
"nnoremap <Space><C-p> :<C-u>Unite yankround<CR>
" }}}

NeoBundle 'Townk/vim-autoclose'

NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}

NeoBundle 'tpope/vim-surround'

NeoBundle 'vim-scripts/matchit.zip'

" emmet-vim {{{
NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload' : {
  \   'filetypes' : ['html', 'html5', 'php', 'phtml', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee'],
  \   'commands' : ['<Plug>ZenCodingExpandNormal']
  \ }}
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
  \ 'lang' : 'ja',
  \ 'html' : {
  \   'indentation' : '  '
  \ }}
" }}}

" vim-easy-align {{{
NeoBundle 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

NeoBundle 'nathanaelkane/vim-indent-guides'
"NeoBundle 'Yggdroot/indentLine'
"" indentLine {{{
"let g:indentLine_faster = 1
"nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
"" }}}

" vim-quickrun {{{
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
"}}}

NeoBundle 'rcmdnk/vim-markdown'

NeoBundle 'kannokanno/previm'

" open-browser {{{
NeoBundle 'tyru/open-browser.vim'
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Safari'
"}}}

NeoBundle 'mattn/webapi-vim'

NeoBundle 'moznion/hateblo.vim'

NeoBundle "slim-template/vim-slim"

" vim-ref {{{
NeoBundleLazy 'thinca/vim-ref', {'functions': 'ref#K'}
let g:ref_no_default_key_mappings = 1
"inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
nnoremap <silent>K     :<C-u>call<Space>ref#K('normal')<CR>
let s:hooks = neobundle#get_hooks('vim-ref')
function! s:hooks.on_source(bundle) abort "{{{
  let g:ref_cache_dir      = $HOME .'/.vim/vim-ref/cache'
  let g:ref_phpmanual_path = $HOME .'/.vim/vim-ref/php-chunked-xhtml'
endfunction "}}}
"}}}

" lightline {{{
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
\ 'colorscheme': 'jellybeans'
\}
"}}}

" fugitive {{{
" vim で git する用
NeoBundle 'tpope/vim-fugitive'
" }}}

" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()

filetype plugin indent on
"}}}

" ---------------------------------------------------------------------------

set t_Co=256
syntax enable
colorscheme jellybeans

set nonumber
set title
set showcmd
set laststatus=2
set visualbell t_vb=
set ignorecase
set smartcase

" インデント設定 
set tabstop=2

augroup vimrc
  autocmd! FileType perl setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType php  setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType ruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType css  setlocal shiftwidth=4 tabstop=4 softtabstop=4
augroup END

set autoindent
set smartindent
set expandtab
set smarttab

set shiftround
set nowrap
set hidden
set history=2000
set hlsearch
set incsearch
set ruler
set cursorline
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<

noremap <Space>h ^
noremap <Space>l $
nnoremap <Space>/ *<C-o>
nnoremap g<Space>/ g*<C-o>
nnoremap ;  :
nnoremap :  ;
vnoremap ;  :
vnoremap :  ;
nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q gq
vnoremap  <Up>     <nop>
vnoremap  <Down>   <nop>
vnoremap  <Left>   <nop>
vnoremap  <Right>  <nop>
inoremap  <Up>     <nop>
inoremap  <Down>   <nop>
inoremap  <Left>   <nop>
inoremap  <Right>  <nop>
noremap   <Up>     <nop>
noremap   <Down>   <nop>
noremap   <Left>   <nop>
noremap   <Right>  <nop>

set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp

" PHP settings {{{
let g:php_baselib=1
let g:php_htmlInStrings=1
let g:php_noShortTags=1
let g:php_sql_query=1
" }}}

" SQL syntax setting
let g:sql_type_default='mysql'

" Update ctags when file has been saved
autocmd BufWritePost *
  \ if exists('b:git_dir') && executable(b:git_dir.'/hooks/ctags') |
  \   call system('"'.b:git_dir.'/hooks/ctags" &') |
  \ endif
