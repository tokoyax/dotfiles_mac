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

" unite {{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_winwidth = 30
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,ug :<C-u>Unite vimgrep<CR>

" rails の設定
nnoremap <silent> ,urc :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap <silent> ,urfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap <silent> ,urm :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap <silent> ,urfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap <silent> ,urv :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap <silent> ,urfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap <silent> ,urs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap <silent> ,urfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap <silent> ,urj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap <silent> ,urfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap <silent> ,uro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap <silent> ,urfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap <silent> ,url :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap <silent> ,urfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap <silent> ,urr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap <silent> ,urfr :<C-u>Unite file file/new -input=spec/ <CR>
" }}} unite

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

" vimshell {{{
NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>
" }}}

" yankround.vim {{{
NeoBundle 'LeafCage/yankround.vim'
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
" }}}
NeoBundle 'Townk/vim-autoclose'
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload' : {
  \   'filetypes' : ['html', 'html5', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee'],
  \   'commands' : ['<Plug>ZenCodingExpandNormal']
  \ }}
" emmet {{{
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
inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
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
"color
set t_Co=256
syntax on
colorscheme jellybeans

"display
set number
set title
set showcmd
set laststatus=2

"sound
set visualbell t_vb=

"search
set ignorecase
set smartcase
set smartindent

"tab
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set shiftround
set nowrap

"datetime
inoremap <Leader>c <C-R>=strftime('%Y-%m-%dT%H:%M:%S+09:00')<CR>

"backup, swap, undo files
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp

" PHP settings {{{
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1
" }}}

" SQL syntax setting
let g:sql_type_default = 'mysql'

" Update ctags when file has been saved
autocmd BufWritePost *
  \ if exists('b:git_dir') && executable(b:git_dir.'/hooks/ctags') |
  \   call system('"'.b:git_dir.'/hooks/ctags" &') |
  \ endif
