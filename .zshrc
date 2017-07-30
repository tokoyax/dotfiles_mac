##############################################
# environment variables
export LANG=ja_JP.UTF-8
export TERM="xterm-256color"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:`yarn global bin`"
export GOPATH="$HOME/LocalDev/go_work"
export PATH="$PATH:$GOPATH/bin"
eval "$(rbenv init - zsh)"

##############################################
# keybind
bindkey -d # reset keybind
bindkey -e

##############################################
# prompt
autoload colors
colors

case ${UID} in
0)
  PROMPT="%B%{${fg[green]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[green]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[green]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[green]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[green]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

##############################################
# terminal title
case "${TERM}" in
kterm*|xterm)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac

##############################################
# completion
autoload -Uz compinit
compinit

# completion color
zstyle ':completion:*:default' menu select=1 # select completion with cursor
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' ignore-parents parent pwd .. # ignore current directory when ../
zstyle ':completion:*' matcher-list 'm:{a-z}={a-z}' # enable upper and lower case
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/x11r6/bin
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

##############################################
# history
histfile=~/.zsh_history
histsize=1000000
savehist=1000000
setopt hist_ignore_dups #ignore duplicate command
setopt hist_ignore_space
setopt share_history #share command history
setopt hist_reduce_blanks

# history search
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

##############################################
# options

# enable japanese file name
setopt print_eight_bit

# change directory without cd command
setopt auto_cd

# list previous directories
setopt auto_pushd
setopt pushd_ignore_dups

# correct input
setopt correct

# be compact completion list
setopt list_packed

# no beep
setopt no_beep
setopt nolistbeep

# predict input
autoload predict-on
predict-on

# disable flow control
setopt no_flow_control

# ignore C-d
setopt ignore_eof

# set '#' comment
setopt interactive_comments

# extend glob
# regexp, wildcard, etc...
setopt extended_glob

# glob させない
setopt nonomatch

##############################################
# alias
setopt complete_aliases # aliased ls needs if file/dir completions work

alias where="command -v"
alias j="jobs -l"

alias ls="ls -G -w"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias fig='UID=${UID} GID=${GID} docker-compose'


##############################################
# color
unset LSCOLORS
case "${TERM}" in
xterm)
  export TERM=xterm-color
  ;;
kterm)
  export TERM=kterm-color
  # set BackSpace control character
  stty erase
  ;;
cons25)
  unset LANG
  export LSCOLORS=ExFxCxdxBxegedabagacad
  export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
  zstyle ':completion:*' list-colors \
    'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
  ;;
esac

##############################################
# vim
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

##############################################
# direnv
# https://github.com/direnv/direnv
eval "$(direnv hook zsh)"

##############################################
# load .zshrc when my zshrc exists
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine

# vim:set ft=zsh:
