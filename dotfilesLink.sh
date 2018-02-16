#!/bin/sh
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.globalrc ~/.globalrc
ln -sf ~/dotfiles/.xinitrc ~/.xinitrc
ln -sf ~/dotfiles/.Xresources ~/.Xresources
ln -sf ~/dotfiles/.xsession ~/.xsession
ln -sf ~/dotfiles/.xmodmap ~/.xmodmap
ln -sf ~/dotfiles/.xkeysnail.config.py ~/.xkeysnail.config.py
ln -sf ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
ln -sf ~/dotfiles/.config/fish/functions/peco_change_directory.fish ~/.config/fish/functions/peco_change_directory.fish
ln -sf ~/dotfiles/.config/fish/functions/peco_select_history.fish ~/.config/fish/functions/peco_select_history.fish

mkdir ~/.vim/tmp/ && chmod 777 $_
