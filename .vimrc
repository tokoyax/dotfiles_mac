set modeline
set modelines=3
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0

let g:mapleader = "\<Space>"

if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

" Plugins {{{
filetype plugin indent on
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('~/.vim/dein'))
  call dein#begin(expand('~/.vim/dein'))

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('nixprime/cpsm', {
        \ 'build' : 'env PY3=ON ./install.sh'
        \ })
  " Util {{{
  call dein#add('Shougo/vimproc', {
    \ 'build' : {
    \     'windows': 'make -f make_mingw32.mak',
    \     'cygwin':  'make -f make_cygwin.mak',
    \     'mac':     'make -f make_mac.mak',
    \     'unix':    'make -f make_unix.mak',
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
  " esa.io 投稿
  call dein#add('upamune/esa.vim')
  " git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  " https://rhysd.hatenablog.com/entry/2019/03/10/230119
  call dein#add('rhysd/git-messenger.vim', {
              \   'lazy' : 1,
              \   'on_cmd' : 'GitMessenger',
              \   'on_map' : '<Plug>(git-messenger)',
              \ })
  " quickfix をステータスバーに表示
  call dein#add("dannyob/quickfixstatus")
  " ag search
  call dein#add('rking/ag.vim')
  " benchmark
  call dein#add('mattn/benchvimrc-vim')
  " terminal
  call dein#add('kassio/neoterm')
  call dein#add('mklabs/split-term.vim')
  " comment out
  call dein#add('tomtom/tcomment_vim')
  " csv
  " https://github.com/mechatroner/rainbow_csv
  call dein#add('mechatroner/rainbow_csv')
  " snake <-> camel, :S/ 検索
  " https://qiita.com/yuku_t/items/77a3361ff4d27bda641e
  call dein#add ('tpope/vim-abolish')
  " }}}
  " Filer {{{
  call dein#add('cocopon/vaffle.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('chemzqm/denite-extra')
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
  " }}}
  " Window {{{
  call dein#add('simeji/winresizer')
  " }}}
  " Color {{{
  " call dein#add('altercation/vim-colors-solarized')
  call dein#add('w0ng/vim-hybrid')
  " }}}
  " Completion {{{
  " call dein#add('autozimu/LanguageClient-neovim', {
  "   \ 'rev': 'next',
  "   \ 'build': 'bash install.sh',
  "   \ })
  call dein#add('neoclide/coc.nvim', {
    \ 'merge': 0,
    \ 'branch': 'release'
    \ })
  call dein#add('Shougo/deoplete.nvim', {
    \ 'do': ':UpdateRemotePlugins'
    \ })
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('Shougo/neco-syntax')
  call dein#add('pbogut/deoplete-elm')
  call dein#add('eagletmt/neco-ghc')
  "}}}
  " Tags {{{
  " call dein#add('jsfaint/gen_tags.vim')
  " call dein#add('ozelentok/denite-gtags')
  " call dein#add('vim-scripts/gtags.vim')
  " }}}
  " Edit {{{
  " 括弧自動閉じ
  call dein#add('tpope/vim-endwise')
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
  " ブロックとワンライナーをトグルで切り替える
  call dein#add('AndrewRadev/splitjoin.vim')
  " surround.vim などを . でリピートできるように
  call dein#add('tpope/vim-repeat')
  " fast fold
  call dein#add('Konfekt/FastFold')
  " }}}
  " Move {{{
  " 対応する括弧に移動
  call dein#add('vim-scripts/matchit.zip')
  " f{char}の移動を便利に
  call dein#add('rhysd/clever-f.vim')
  " camelcase, snakecase の移動
  call dein#add('vim-scripts/camelcasemotion')
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
  call dein#add('cocopon/lightline-hybrid.vim')
  " 単語単位のdiff
  call dein#add('rickhowe/diffchar.vim')
  " 対応括弧強調
  call dein#add('itchyny/vim-parenmatch')
  " cursor下のワードに下線ひく
  " call dein#add('itchyny/vim-cursorword')
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
  " IME 制御 {{{
  if has ("unix") && !has("mac")
    call dein#add('fuenor/im_control.vim')
  endif
  " }}}
  " Document {{{
  call dein#add('rizzatti/dash.vim')
  " }}}
  " Linter {{{
  call dein#add('w0rp/ale')
  " }}}
  "--------------------------------------------------------------
  " 言語別
  "--------------------------------------------------------------
  " markdown {{{
  " markdown ハイライト
  call dein#add('rcmdnk/vim-markdown')
  " }}}
  " javascript {{{
  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  " }}}
  " coffeescript {{{
  call dein#add('kchmck/vim-coffee-script')
  " }}}
  " elixir {{{
  call dein#add('elixir-lang/vim-elixir')
  "call dein#add('archSeer/elixir.nvim')
  call dein#add('slashmili/alchemist.vim')
  "}}}
  " ruby {{{
  call dein#add('tpope/vim-rails')
  call dein#add('tpope/vim-dispatch')
  call dein#add('janko-m/vim-test')
  call dein#add('vim-ruby/vim-ruby')
  call dein#add('noprompt/vim-yardoc')
  " }}}
  " slim {{{
  call dein#add('slim-template/vim-slim')
  " }}}
  " haskell {{{
  call dein#add('nbouscal/vim-stylish-haskell')
  call dein#add('neovimhaskell/haskell-vim')
  " }}}
  " elm {{{
  call dein#add('ElmCast/elm-vim')
  " call dein#add('carmonw/elm-vim')
  " }}}
  " fish {{{
  call dein#add('dag/vim-fish')
  " }}}
  " vue {{{
  call dein#add('posva/vim-vue')
  call dein#add('digitaltoad/vim-pug')
  " }}}

  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif
" }}}
" ---------------------------------------------------------------------------
"  ぷらぎんせってぃんぐ
" ---------------------------------------------------------------------------
" denite.vim {{{
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> <C-m>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> v
        \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> t
        \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating'
    \ })

call denite#custom#option('default', {
    \ 'prompt': '>',
    \ 'highlight_matched_char': 'Underlined'
    \ })

" ag があればそれで grep
if executable('ag')
  " file/rec
  call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', ''])
  " grep
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'pattern_opt', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'final_opts', [])
endif

" ファイル検索
nnoremap <silent> <Leader>f :<C-u>DeniteProjectDir file/rec<CR>
" バッファリスト
nnoremap <silent> <Leader>b :<C-u>Denite buffer<CR>
" MRU
nnoremap <silent> <Leader>m :<C-u>Denite file/old<CR>
" カーソル以下の単語をgrep
nnoremap <silent> <Leader>cg :<C-u>DeniteCursorWord grep -buffer-name=search line<CR><C-R><C-W><CR>
" 普通にgrep
nnoremap <silent> <Leader>g :<C-u>Denite -buffer-name=search grep<CR>
" resume previous buffer
nnoremap <silent> <Leader>r :<C-u>Denite -resume -buffer-name=search<CR>
" quickfix list
nnoremap <silent> <Leader>q :<C-u>Denite quickfix<CR>
" location list
nnoremap <silent> <Leader>l :<C-u>Denite location_list<CR>
" history
nnoremap <silent> <Leader>h :<C-u>Denite command_history<CR>
" customize ignore globs
call denite#custom#source(
      \ 'file/rec',
      \ 'matchers', ['matcher/fuzzy', 'matcher/ignore_globs', 'matcher/cpsm', 'matcher/project_files'])
call denite#custom#source(
      \ 'file/old',
      \ 'matchers', ['matcher/fuzzy', 'matcher/ignore_globs', 'matcher/cpsm', 'matcher/project_files'])
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
      \ [
      \ '.git/', 'build/', '__pycache__/',
      \ 'node_modules/',
      \ 'images/', '*.o', '*.make',
      \ '*.min.*',
      \ 'img/', 'fonts/'])
" grepの結果のファイル名でも絞りこめるようにする
call denite#custom#source('grep', 'converters', ['converter/abbr_word'])
" qfreplace と 連携
" https://qiita.com/hrsh7th@github/items/303d46ba13532c502828
if dein#tap('denite.nvim') && dein#tap('vim-qfreplace')
  function! MyDeniteReplace(context)
    let qflist = []
    for target in a:context['targets']
      if !has_key(target, 'action__path') | continue | endif
      if !has_key(target, 'action__line') | continue | endif
      if !has_key(target, 'action__text') | continue | endif

      call add(qflist, {
            \ 'filename': target['action__path'],
            \ 'lnum': target['action__line'],
            \ 'text': target['action__text']
            \ })
    endfor
    call setqflist(qflist)
    call qfreplace#start('')
  endfunction
  call denite#custom#action('file', 'qfreplace', function('MyDeniteReplace'))
endif
" }}}
" Vaffle {{{
nnoremap <silent> <C-f> :<C-u>Vaffle %:p:h<CR>
let g:vaffle_show_hidden_files = 1
function! s:customize_vaffle_mappings() abort
  " Customize key mappings here
  nmap <buffer> v <Plug>(vaffle-open-selected-split)
  nmap <buffer> s <Plug>(vaffle-open-selected-vsplit)
endfunction
augroup vimrc_vaffle
  autocmd!
  autocmd FileType vaffle call s:customize_vaffle_mappings()
augroup END
" }}}
" LanguageClient-neovim {{{
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"     \ 'ruby':           ['solargraph', 'stdio'],
"     \ 'css':            ['css-languageserver', '--stdio'],
"     \ 'sass':           ['css-languageserver', '--stdio'],
"     \ 'scss':           ['css-languageserver', '--stdio'],
"     \ 'less':           ['css-languageserver', '--stdio'],
"     \ 'javascript':     ['javascript-typescript-stdio'],
"     \ 'vue':            ['vls'],
"     \}
" noremap [LanguageClient]  <Nop>
" nmap <Leader>l [LanguageClient]
" nnoremap [LanguageClient]h :call LanguageClient_textDocument_hover()<CR>
" nnoremap [LanguageClient]d :call LanguageClient_textDocument_definition()<CR>
" nnoremap [LanguageClient]m :call LanguageClient_textDocument_rename()<CR>
" nnoremap [LanguageClient]f :call LanguageClient_textDocument_formatting()<CR>
" nnoremap [LanguageClient]r :call LanguageClient_textDocument_references()<CR>
" }}}
" gen_tags {{{
" let g:gen_tags#ctags_auto_gen = 1
" let g:gen_tags#gtags_auto_gen = 1
" let g:gen_tags#blacklist = ['$HOME']
" let g:gen_tags#status_line = 1
" autocmd User GenTags#CtagsLoaded echo "Ctags Loaded."
" autocmd User GenTags#GtagsLoaded echo "Gtags Loaded."
" " }}}
" " denite-gtags {{{
" noremap [denite-gtags]  <Nop>
" nmap <Leader>t [denite-gtags]
" nnoremap [denite-gtags]d :<C-u>DeniteCursorWord -buffer-name=gtags_def -mode=normal gtags_def<CR>
" nnoremap [denite-gtags]r :<C-u>DeniteCursorWord -buffer-name=gtags_ref -mode=normal gtags_ref<CR>
" nnoremap [denite-gtags]c :<C-u>DeniteCursorWord -buffer-name=gtags_context -mode=normal gtags_context<CR>
" }}}
" neosnippet {{{
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" }}}
" emmet-vim {{{
" <C-e>, で発動
let g:user_emmet_leader_key = '<C-e>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'indentation' : '  '
      \   },
      \ 'javascript.jsx' : {
      \   'extends' : 'jsx',
      \ },
      \}
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
" previm {{{
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Safari'
"}}}
" lightline {{{
let g:lightline = {
      \ 'colorscheme': 'hybrid',
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
" deoplete.vim {{{
" deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
\})
" options
let g:deoplete#auto_complete_delay = 0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 0
let g:deoplete#enable_ignore_case = 0
let g:deoplete#enable_refresh_always = 0
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_list = 10000
" }}}
" winresizer {{{
" If you want to start window resize mode by `Ctrl+T`
let g:winresizer_start_key = '<C-T>'
" If you cancel and quit window resize mode by `z` (keycode 122)
let g:winresizer_keycode_cancel = 122
" }}}
" split-term {{{
set splitright
set splitbelow
" }}}
" esa.vim {{{
let g:esa_team = 'tokoyax'
" }}}
" ale {{{
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ }
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier', 'eslint']
let g:ale_fixers['vue'] = ['prettier', 'eslint']
let g:ale_fix_on_save = 0
let g:ale_javascript_prettier_use_local_config = 1
" }}}
" vim-test {{{
let test#strategy = "neovim"
let test#ruby#rspec#executable = 'rspec'

" https://qiita.com/joker1007/items/4dbff328f39c11e732af
function! DockerTransformer(cmd) abort
  if $APP_CONTAINER_NAME != ''
    let container_id = system('docker ps --filter name=$APP_CONTAINER_NAME -q')
    return 'docker exec -t ' . container_id . ' spring ' . a:cmd
  else
    return 'bundle exec ' . a:cmd
  endif
endfunction

let g:test#custom_transformations = {'docker': function('DockerTransformer')}
let g:test#transformation = 'docker'

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
noremap <silent> t<C-n> :TestNearest<CR>
noremap <silent> t<C-f> :TestFile<CR>
noremap <silent> t<C-s> :TestSuite<CR>
noremap <silent> t<C-l> :TestLast<CR>
noremap <silent> t<C-g> :TestVisit<CR>
" }}}
" dash {{{
nmap <silent> <Leader>k <Plug>DashSearch
" }}}
" splitjoin {{{
nnoremap <silent> <Leader>sjj :SplitjoinJoin<cr>
nnoremap <silent> <Leader>sjs :SplitjoinSplit<cr>
" }}}
" elm-vim {{{
let g:elm_setup_keybindings = 0
" }}}
" git-messenger {{{
nmap <Leader>gm <Plug>(git-messenger)
let g:git_messenger_close_on_cursor_moved = 1
let g:git_messenger_no_default_mappings = 1
let g:git_messenger_into_popup_after_show = 1
let g:git_messenger_always_into_popup = 1
" }}}

" ---------------------------------------------------------------------------
"  きほんせってい
" ---------------------------------------------------------------------------
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double " ※などがずれるので
syntax enable
autocmd FileType jsp,asp,php,xml,perl syntax sync minlines=500 maxlines=1000
autocmd FileType vue syntax sync fromstart
set termguicolors
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
colorscheme hybrid
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
" set grepprg=hw\ --no-group\ --no-color

" git commit で差分確認
" https://qiita.com/soramugi/items/a56b570a80372994000b
autocmd FileType gitcommit DiffGitCached | wincmd x | resize 10

" インデント設定
set tabstop=2
set shiftwidth=2
set softtabstop=2
augroup vimrc
  autocmd! FileType perl    setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType php     setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType ruby    setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType eruby   setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType html    setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd! FileType css     setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType elm     setlocal shiftwidth=4 tabstop=4 softtabstop=4
  autocmd! FileType haskell setlocal shiftwidth=4 tabstop=4 softtabstop=4
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
set diffopt=filler,vertical

" ---------------------------------------------------------------------------
" custom keymap
" ---------------------------------------------------------------------------
nnoremap <Space> <Nop>
noremap <C-h> ^
noremap <C-l> $
nnoremap <Leader>/ *<C-o>
nnoremap g<Leader>/ g*<C-o>
"highlight off
nnoremap <silent> <Leader>nh :noh<CR>
" 連続ペースト用
nnoremap <Leader>p "0p<CR>
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
" terminal 設定
if has('nvim')
  tnoremap <C-o> <C-\><C-n>
  tnoremap <silent> <ESC> <C-\><C-n>
end
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]>
" buffer delete時にウインドウを消さない
noremap <Leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>

" ---------------------------------------------------------------------------
" other
" ---------------------------------------------------------------------------
" not stop completion $ & /
setlocal iskeyword+=$
setlocal iskeyword+=-

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

" 折りたたみ設定
" ファイルをオープンするとき重いので無効に
" set foldmethod=syntax
" set foldlevel=1
" set foldnestmax=2
" autocmd InsertEnter * if !exists('w:last_fdm')
"             \| let w:last_fdm=&foldmethod
"             \| setlocal foldmethod=manual
"             \| endif
" autocmd InsertLeave,WinLeave * if exists('w:last_fdm')
"             \| let &l:foldmethod=w:last_fdm
"             \| unlet w:last_fdm
"             \| endif

if has ("unix") && !has("mac")
  " clipboard settings
  " https://github.com/neovim/neovim/issues/583
  function! ClipboardYank()
    call system('xclip -i -selection clipboard', @@)
  endfunction
  function! ClipboardPaste()
    let @@ = system('xclip -o -selection clipboard')
  endfunction

  vnoremap <silent> y y:call ClipboardYank()<cr>
  vnoremap <silent> d d:call ClipboardYank()<cr>
  nnoremap <silent> p :call ClipboardPaste()<cr>p

  " -------------------------------------------
  "  IME setting
  "
  " 「日本語入力固定モード」の動作モード
  let IM_CtrlMode = 1
  " 「日本語入力固定モード」切替キー
  inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
  " IBus 1.5以降
  function! IMCtrl(cmd)
    let cmd = a:cmd
    if cmd == 'On'
      let res = system('ibus engine "mozc-jp"')
    elseif cmd == 'Off'
      let res = system('ibus engine "xkb:us::eng"')
    endif
    return ''
  endfunction
  " <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください。
  " IMCtrl()のsystem()コマンド実行時に&を付けて非同期で実行するという方法でも体感速度が上がる場合があります。
  set timeout timeoutlen=3000 ttimeoutlen=100 
  " 「日本語入力固定モード」がオンの場合、ステータス行にメッセージ表示
  set statusline+=%{IMStatus('[日本語固定]')}
  " im_control.vimがない環境でもエラーを出さないためのダミー関数
  function! IMStatus(...)
    return ''
  endfunction
endif
