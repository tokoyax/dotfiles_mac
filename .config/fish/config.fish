##############################################
# environment variables
set -x LANG ja_JP.UTF-8
set -x TERM xterm-256color
set -x GOPATH $HOME/dev/go_work
set -x PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin
set -x PATH $PATH `yarn global bin`
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/.local/bin
if test (uname) = "Darwin"
  eval (rbenv init - | source)
end

##############################################
# key binding
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
end

##############################################
# message
set fish_greeting "(^o^)"

##############################################
# prompt
set fish_git_dirty_color red
set fish_git_not_dirty_color yellow

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  printf '%s%s%s > ' (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

function fish_right_prompt -d 'Write out the right prompt'
  set -l git_dir (git rev-parse --git-dir 2> /dev/null)
  if test -n "$git_dir"
    printf '[%s][%s@%s]' (parse_git_branch) (whoami) (hostname|cut -d . -f 1)
  else
    printf '[%s@%s]' (whoami) (hostname|cut -d . -f 1)
  end
end

##############################################
# history
function sync_history --on-event fish_preexec
  history save
  history merge
end

##############################################
# alias
alias fig='docker-compose'
if test (uname) = "Darwin"
  alias rm='rmtrash'
end
alias tmux='tmux -u'
alias l='exa -hla --git'
alias ls='exa'

##############################################
# neovim
if test (uname) = "Darwin"
  if test -f /usr/local/bin/nvim
    set -x EDITOR /usr/local/bin/nvim
    alias vi='/usr/local/bin/nvim'
    alias vim='/usr/local/bin/nvim'
  end
else
  if test -f /usr/bin/nvim
    set -x EDITOR /usr/bin/nvim
    alias vi='/usr/bin/nvim'
    alias vim='/usr/bin/nvim'
  end
end

##############################################
# direnv
# https://github.com/direnv/direnv
eval (direnv hook fish | source)

# vim:set ft=fish:
