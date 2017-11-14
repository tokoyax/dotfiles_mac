set modeline
set modelines=3
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0

" Plugins {{{
filetype plugin indent on
syntax enable
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/dein.vim')
  " Util {{{
  call dein#add('Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin' : 'make -f make_cygwin.mak',
    \     'mac' : 'make -f make_mac.mak',
    \     'unix' : 'make -f make_unix.mak',
    \    },
    \ })
  " markdown の プレビュー
  call dein#add('kannokanno/previm')
  " URI 開いたり
  call dein#add('tyru/open-browser.vim')
  " API 叩く
  call dein#add('mattn/webapi-vim')
  " はてなブログ投稿
  call dein#add('moznion/hateblo.vim')
  " Document 見る
  call dein#add('thinca/vim-ref', {'functions': 'ref#K'})
  " git
  call dein#add('tpope/vim-fugitive')
  " quickfix をステータスバーに表示
  call dein#add("dannyob/quickfixstatus")
  " ag search
  call dein#add('rking/ag.vim')
  " benchmark
  call dein#add('mattn/benchvimrc-vim')
  " }}}
  " Filer {{{
  call dein#add('justinmk/vim-dirvish')
  call dein#add('mattn/ctrlp.vim')
  " }}}
  " Color {{{
  call dein#add('altercation/vim-colors-solarized')
  " Completion {{{
  "}}}
  " Tags {{{
  call dein#add('soramugi/auto-ctags.vim')
  call dein#add('vim-scripts/gtags.vim')
  " }}}
  " Input {{{
  " 括弧自動閉じ
  call dein#add("kana/vim-smartinput")
  call dein#add("cohama/vim-smartinput-endwise")
  " 文字を囲んだり
  call dein#add('tpope/vim-surround')
  " HTMLタグを素早く書く
  call dein#add('mattn/emmet-vim', {
    \ 'autoload' : {
    \   'filetypes' : ['html', 'html5', 'php', 'phtml', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee', 'eelixir'],
    \   'commands' : ['<Plug>ZenCodingExpandNormal']
    \ }})
  " quickfixを更に絞りこめる
  call dein#add('fuenor/qfixgrep')
  " quickfixを置換対象にする
  call dein#add('thinca/vim-qfreplace')
  " }}}
  " Move {{{
  " 対応する括弧に移動
  call dein#add('vim-scripts/matchit.zip')
  " f{char}の移動を便利に
  call dein#add('rhysd/clever-f.vim')
  " }}}
  " Format {{{
  call dein#add('junegunn/vim-easy-align')
  " }}}
  " Appearance {{{
  " インデントわかりやすくするやつ
  call dein#add('Yggdroot/indentLine')
  " ハイライト
  call dein#add("cohama/vim-hier")
  " ステータスライン変える
  call dein#add('itchyny/lightline.vim')
  " 単語単位のdiff
  call dein#add('rickhowe/diffchar.vim')
  " 対応括弧強調
  call dein#add('itchyny/vim-parenmatch')
  " cursor下のワードに下線ひく
  call dein#add('itchyny/vim-cursorword')
  " }}}
  " Execution {{{
  " プログラムをVimから実行して結果見る
  call dein#add('thinca/vim-quickrun', {'commands': 'QuickRun'})
  " vim-quickrun の 汎用的な quickrun-hook 集
  call dein#add("osyo-manga/shabadou.vim")
  " ステップ実行
  call dein#add('joonty/vdebug')
  " }}}
  " Syntax {{{
  " 構文チェック
  call dein#add('osyo-manga/vim-watchdogs')
  " }}}
  " tmux {{{
  " tmux用
  call dein#add('tpope/vim-obsession')
  " }}}
  "--------------------------------------------------------------
  " 言語別
  "--------------------------------------------------------------
  " php {{{
  " コーディング規約チェック
  call dein#add('stephpy/vim-php-cs-fixer', {'functions': 'PhpCsFixerFixFile'})
  " }}}
  " markdown {{{
  " markdown ハイライト
  call dein#add('rcmdnk/vim-markdown')
  " }}}
  " slim {{{
  call dein#add("slim-template/vim-slim")
  " }}}
  " javascript {{{
  call dein#add('pangloss/vim-javascript')
  " }}}
  " coffeescript {{{
  call dein#add('kchmck/vim-coffee-script')
  " }}}
  " elixir {{{
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  "}}}
  " ruby {{{
  call dein#add('tpope/vim-rails')
  call dein#add('vim-ruby/vim-ruby')
  " }}}
  " slim {{{
  call dein#add('slim-template/vim-slim')
  " }}}

  call dein#end()
  call dein#save_state()
endif
"}}}
" ---------------------------------------------------------------------------
"  ぷらぎんせってぃんぐ
" ---------------------------------------------------------------------------
" ctrlp.vim {{{
set wildignore+=*/vendor/*,*/tmp/*,*/.git/*,*.so,*.swp,*.zip,*.jpg,*.png
let g:ctrlp_custom_ignore = '\v[\/](node_modules|build)$'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
" ag があればキャッシュ使わない ちょっぱや
if executable('ag')
  let g:ctrlp_use_caching=0
  let g:ctrlp_user_command='ag %s -l --nocolor --nogroup -g ""'
endif
" }}}
" auto-ctags {{{
let g:auto_ctags = 0
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
" }}}
" gtags.vim {{{
" ,gでタグファイルを生成する
nnoremap ,g :!gtags -v<CR>
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
\        'outputter':                           'error',
\        'outputter/error/success':             'buffer',
\        'outputter/error/error':               'quickfix',
\        'outputter/buffer/close_on_empty':     1,
\        'outputter/buffer/split':              ':rightbelow 8sp',
\        'runner':                              'vimproc',
\        'runner/vimproc/updatetime':           60},
\    'watchdogs_checker/_': {
\        'outputter/quickfix/open_cmd' : '',
\        },
\    'watchdogs_checker/php': {
\        'command': 'php',
\        'cmdopt':  '-l -d error_reporting=E_ALL -d display_errors=1 -d display_startup_errors=1 -d log_errors=0 -d xdebug.cli_color=0',
\        'exec':    '%c %o %s:p',
\        'errorformat': '%m\ in\ %f\ on\ line\ %l'}}
"}}}
" vim-watchdogs {{{
let g:watchdogs_check_BufWritePost_enable  = 1
let g:watchdogs_check_CursorHold_enable    = 0
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
"let g:ref_no_default_key_mappings = 1
""inoremap <silent><C-k> <C-o>:call<Space>ref#K('normal')<CR><ESC>
"nnoremap <silent>K     :<C-u>call<Space>ref#K('normal')<CR>
"let s:hooks = neobundle#get_hooks('vim-ref')
"function! s:hooks.on_source(bundle) abort "{{{
"  let g:ref_cache_dir      = $HOME .'/.vim/vim-ref/cache'
"  let g:ref_phpmanual_path = $HOME .'/.vim/vim-ref/php-chunked-xhtml'
"  let g:ref_refe_cmd       = $HOME .'/.rbenv/shims/refe'
"endfunction "}}}
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
" clever-f {{{
let g:clever_f_ignore_case = 1
let g:clever_f_use_migemo = 1
let g:clever_f_chars_match_any_signs = ';'
" }}}
" vim-parenmatch {{{
let g:loaded_matchparen = 1
" }}}

" ---------------------------------------------------------------------------
"  きほんせってい
" ---------------------------------------------------------------------------
" ※などがずれるので
set ambiwidth=double
set t_Co=256
syntax enable
autocmd FileType jsp,asp,php,xml,perl syntax sync minlines=500 maxlines=1000
"autocmd VimEnter,Colorscheme * highlight SpecialKey cterm=NONE ctermfg=239 ctermbg=NONE
"autocmd VimEnter,Colorscheme * highlight NonText cterm=NONE ctermfg=239 ctermbg=NONE
"autocmd VimEnter,Colorscheme * highlight SpellBad cterm=underline ctermfg=196 ctermbg=NONE

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

" yank したら * レジスタにもコピー
set clipboard+=unnamed

" highway grep
set grepprg=hw\ --no-group\ --no-color

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
" くそ重たくなる対策
set lazyredraw
set ttyfast

" ---------------------------------------------------------------------------
" keymap
" ---------------------------------------------------------------------------
noremap <Space>h ^
noremap <Space>l $
nnoremap <Space>/ *<C-o>
nnoremap g<Space>/ g*<C-o>
" 連続ペースト用
nnoremap <Space>p "0p
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
nnoremap Q ge
" paste toggle
inoremap <F11> <nop>
set pastetoggle=<F11>
autocmd InsertLeave * set nopaste
" 方向キーなどいらぬ
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

" tmp directory
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp
set undodir=~/.vim/tmp
" tags directory
set tags+=.git/tags

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
" SQL syntax setting
let g:sql_type_default='mysql'

" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>

" 折りたたみ設定
set foldmethod=syntax
set foldlevel=1
set foldnestmax=2
autocmd InsertEnter * if !exists('w:last_fdm')
            \| let w:last_fdm=&foldmethod
            \| setlocal foldmethod=manual
            \| endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm')
            \| let &l:foldmethod=w:last_fdm
            \| unlet w:last_fdm
            \| endif
