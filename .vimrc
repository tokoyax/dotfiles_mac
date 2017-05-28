set modeline
set modelines=3
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0

" Plugins {{{

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

" Util {{{
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
" unite {{{
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'hewes/unite-gtags'
" }}}
" markdown の プレビュー
NeoBundle 'kannokanno/previm'
" URI 開いたり
NeoBundle 'tyru/open-browser.vim'
" API 叩く
NeoBundle 'mattn/webapi-vim'
" はてなブログ投稿
NeoBundle 'moznion/hateblo.vim'
" Document 見る
NeoBundleLazy 'thinca/vim-ref', {'functions': 'ref#K'}
" git
NeoBundle 'tpope/vim-fugitive'
" quickfix をステータスバーに表示
NeoBundle "dannyob/quickfixstatus"
" }}}
" Filer {{{
NeoBundle 'justinmk/vim-dirvish'
NeoBundle 'mattn/ctrlp.vim'
" ctrlp の抹茶
NeoBundle 'nixprime/cpsm'
" }}}
" Color {{{
NeoBundle 'altercation/vim-colors-solarized'
"NeoBundle 'nanotech/jellybeans.vim'
" }}}
" Completion {{{
"}}}
" Tags {{{
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'vim-scripts/gtags.vim'
" }}}
" Input {{{
" 括弧自動閉じ
NeoBundle "kana/vim-smartinput"
NeoBundle "cohama/vim-smartinput-endwise"
" 文字を囲んだり
NeoBundle 'tpope/vim-surround'
" HTMLタグを素早く書く
NeoBundleLazy 'mattn/emmet-vim', {
  \ 'autoload' : {
  \   'filetypes' : ['html', 'html5', 'php', 'phtml', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee'],
  \   'commands' : ['<Plug>ZenCodingExpandNormal']
  \ }}
" }}}
" Move {{{
" 対応する括弧に移動
NeoBundle 'vim-scripts/matchit.zip'
" }}}
" Format {{{
NeoBundle 'junegunn/vim-easy-align'
" }}}
" Appearance {{{
" インデントわかりやすくするやつ
NeoBundle 'Yggdroot/indentLine'
" ハイライト
NeoBundle "cohama/vim-hier"
" ステータスライン変える
NeoBundle 'itchyny/lightline.vim'
" 単語単位のdiff
NeoBundle 'rickhowe/diffchar.vim'
" }}}
" Execution {{{
" プログラムをVimから実行して結果見る
NeoBundle 'thinca/vim-quickrun', {'commands': 'QuickRun'}
" vim-quickrun の 汎用的な quickrun-hook 集
NeoBundle "osyo-manga/shabadou.vim"
" ステップ実行
NeoBundle 'joonty/vdebug'
" }}}
" Syntax {{{
" 構文チェック
NeoBundle 'osyo-manga/vim-watchdogs'
" }}}
" tmux {{{
" tmux用
NeoBundle 'tpope/vim-obsession'
" }}}
"--------------------------------------------------------------
" 言語別
"--------------------------------------------------------------
" php {{{
" コーディング規約チェック
NeoBundle 'stephpy/vim-php-cs-fixer', {'functions': 'PhpCsFixerFixFile'}
" }}}
" markdown {{{
" markdown ハイライト
NeoBundle 'rcmdnk/vim-markdown'
" }}}
" slim {{{
NeoBundle "slim-template/vim-slim"
" }}}
" javascript {{{
NeoBundle 'pangloss/vim-javascript'
" }}}
" coffeescript {{{
NeoBundle 'kchmck/vim-coffee-script'
" }}}
" elixir {{{
NeoBundle 'elixir-lang/vim-elixir'
" ruby {{{
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'todesking/ruby_hl_lvar.vim'
" }}}
" ruby {{{
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'todesking/ruby_hl_lvar.vim'
" }}}
" slim {{{
NeoBundle 'slim-template/vim-slim'
" }}}


" vimrc に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()

filetype plugin indent on
"}}}


" ---------------------------------------------------------------------------
"  ぷらぎんせってぃんぐ
" ---------------------------------------------------------------------------
" unite {{{
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
let g:unite_source_file_mru_limit = 200
let g:unite_winwidth = 30
nnoremap <silent> <Space>uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>uo :<C-u>Unite outline<CR>
nnoremap <silent> <Space>um :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> <Space>uy :<C-u>Unite history/yank<CR>
nnoremap <silent> <Space>ug :<C-u>Unite vimgrep -no-quit<CR>
" }}}

" ctrlp.vim {{{
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_custom_ignore = '\v[\/](node_modules|build)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:ctrlp_extensions = ['buffertag', 'quickfix', 'dir',
                        \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
" }}}

" auto-ctags {{{
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
" }}}

" gtags.vim {{{
" ,gでタグファイルを生成する
nnoremap ,g :!gtags<CR>
" カレントファイル内の関数一覧
nnoremap <C-l> :Gtags -f %<CR>
" カーソル上の関数の定義場所へジャンプ
nnoremap <C-j> :GtagsCursor<CR>
vnoremap <C-j> :GtagsCursor<CR>
" Usagesを表示
nnoremap <C-h> :Gtags -r <C-r><C-w><CR>
vnoremap <C-h> :Gtags -r <C-r><C-w><CR>
" }}}

" vim-smartinput-endwise {{{
call smartinput_endwise#define_default_rules()
"}}}

" emmet-vim {{{
" <C-E>, で発動
let g:user_emmet_leader_key = '<C-E>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
  \ 'lang' : 'ja',
  \ 'html' : {
  \   'indentation' : '  '
  \ }}
" }}}

" vim-easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" indentLine {{{
" slim の syntax が効かなくなるため OFF
" let g:indentLine_faster = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '|'
" }}}

" vim-quickrun {{{
nnoremap <Leader>run :<C-u>QuickRun<CR>
let g:quickrun_config = {
\    '_': {
\        'hook/close_buffer/enable_empty_data': 1,
\        'hook/close_buffer/enable_failure':    1,
\        'outputter':                           'multi:buffer:quickfix',
\        'outputter/buffer/close_on_empty':     1,
\        'outputter/buffer/split':              ':botright',
\        'runner':                              'vimproc',
\        'runner/vimproc/updatetime':           600},
\    'watchdogs_checker/_': {
\        'hook/close_quickfix/enable_exit':        1,
\        'hook/back_window/enable_exit':           0,
\        'hook/back_window/priority_exit':         1,
\        'hook/qfstatusline_update/enable_exit':   1,
\        'hook/qfstatusline_update/priority_exit': 2,
\        'outputter/quickfix/open_cmd':            ''},
\    'watchdogs_checker/php': {
\        'command': 'php',
\        'cmdopt':  '-l -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0',
\        'exec':    '%c %o %s:p',
\        'errorformat': '%m\ in\ %f\ on\ line\ %l'}}
"}}}

" vim-watchdogs {{{
let g:watchdogs_check_BufWritePost_enable  = 1
let g:watchdogs_check_CursorHold_enable    = 1
call watchdogs#setup(g:quickrun_config)
"}}}

" vim-php-cs-fixer {{{
nnoremap <Leader>php :<C-u>call<Space>PhpCsFixerFixFile()<CR>
let g:php_cs_fixer_config                 = 'default'
let g:php_cs_fixer_dry_run                = 0
let g:php_cs_fixer_enable_default_mapping = 0
let g:php_cs_fixer_fixers_list            = 'align_equals,align_double_arrow'
let g:php_cs_fixer_level                  = 'symfony'
let g:php_cs_fixer_php_path               = 'php'
let g:php_cs_fixer_verbose                = 0
"}}}

" previm {{{
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Safari'
"}}}

" vim-ref {{{
let g:ref_no_default_key_mappings = 1
"inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
nnoremap <silent>K     :<C-u>call<Space>ref#K('normal')<CR>
let s:hooks = neobundle#get_hooks('vim-ref')
function! s:hooks.on_source(bundle) abort "{{{
  let g:ref_cache_dir      = $HOME .'/.vim/vim-ref/cache'
  let g:ref_phpmanual_path = $HOME .'/.vim/vim-ref/php-chunked-xhtml'
  let g:ref_refe_cmd       = $HOME .'/.rbenv/shims/refe'
endfunction "}}}
"}}}

" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive'
      \ }
  \ }
function! LightlineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
"}}}

" vdebug {{{
let g:vimrc_vdebug = getcwd() . "/.vimrc.vdebug"
if filereadable(g:vimrc_vdebug)
  " source の引数に変数が指定できないため exec で読み込む
  exec ":source " . g:vimrc_vdebug
endif

" -------------------------------------------------------------------------
" パスマップ設定の仕方
" ステップ実行用の .vimrc.vdebug をプロジェクトのルートに配置する
"
"let g:vdebug_options = {
"  \ 'path_maps': {"/path/to/remote/project": "/path/to/local/project"},
"  \
"}
" -------------------------------------------------------------------------
"}}}

" ruby_hl_lvar {{{
let g:ruby_hl_lvar_hl_group = 'RubyLocalVariable'
let g:ruby_hl_lvar_auto_enable = 0
nmap <leader>he <Plug>(ruby_hl_lvar-enable)
nmap <leader>hd <Plug>(ruby_hl_lvar-disable)
nmap <leader>hr <Plug>(ruby_hl_lvar-refresh)
" }}}

" ---------------------------------------------------------------------------
"  きほんせってい
" ---------------------------------------------------------------------------

" ※などがずれるので
set ambiwidth=double

set t_Co=256
syntax enable
autocmd FileType jsp,asp,php,xml,perl syntax sync minlines=500 maxlines=1000

autocmd VimEnter,Colorscheme * highlight SpecialKey cterm=NONE ctermfg=239 ctermbg=NONE
autocmd VimEnter,Colorscheme * highlight NonText cterm=NONE ctermfg=239 ctermbg=NONE
autocmd VimEnter,Colorscheme * highlight SpellBad cterm=underline ctermfg=196 ctermbg=NONE

"colorscheme jellybeans
colorscheme solarized
set background=dark    "または light

set nonumber
set title
set showcmd
set laststatus=2
set visualbell t_vb=
set ignorecase
set smartcase

" インデント設定 
set tabstop=2
set shiftwidth=2
set softtabstop=2

augroup vimrc
  autocmd! FileType perl  setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType php   setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType ruby  setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType eruby setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType html  setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType css   setlocal shiftwidth=4 tabstop=4 softtabstop=4
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
set nocursorline
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
" 1行が長い場合にくそ重たくなるので
set synmaxcol=300

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
" Ruby settings {{{
" hoge? が1個の単語として認識されるようにする
autocmd FileType ruby setl iskeyword+=?
let g:rsenseHome = '/usr/local/bin/rsense'
" }}}

" Ruby settings {{{
let g:rsenseHome = '/Users/Takuya/.rbenv/shims/rsense'
" }}}

" SQL syntax setting
let g:sql_type_default='mysql'

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" 折りたたみ設定
set foldmethod=syntax
set foldlevel=1
set foldnestmax=2
augroup foldmethod-syntax
  autocmd!
  autocmd InsertEnter * if &l:foldmethod ==# 'syntax'
  \                   |   setlocal foldmethod=manual
  \                   | endif
  autocmd InsertLeave * if &l:foldmethod ==# 'manual'
  \                   |   setlocal foldmethod=syntax
  \                   | endif
augroup END

" Update ctags when file has been saved
autocmd BufWritePost *
  \ if exists('b:git_dir') && executable(b:git_dir.'/hooks/ctags') |
  \   call system('"'.b:git_dir.'/hooks/ctags" &') |
  \ endif
