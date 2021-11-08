" display & information
set lines=25        " typical
set columns=90      " margin for 'number' and 'foldcolumn'
set cmdheight=1     " MacVim $VIM/gvimrc overwrites my .vimrc settings
set guioptions=c    " show no GUI components

" no way to use a mouse
set mouse=
set nomousefocus
set mousehide

set guifont=HackGenNerd_Console:h16

" turn off disabling IM at entering input mode
if exists('&imdisableactivate')
    set noimdisableactivate
endif
