#! /usr/local/bin/fish
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.ctags ~/.ctags
ln -sf ~/dotfiles/.ghci ~/.ghci
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.haskeline ~/.haskeline
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.globalrc ~/.globalrc
ln -sf ~/dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
mkdir ~/.config/fish/functions/
ln -sf ~/dotfiles/.config/fish/functions/peco_change_directory.fish ~/.config/fish/functions/peco_change_directory.fish
ln -sf ~/dotfiles/.config/fish/functions/peco_select_history.fish ~/.config/fish/functions/peco_select_history.fish
mkdir ~/.config/fish/completions/
ln -sf ~/dotfiles/.config/fish/completions/hub.fish ~/.config/fish/completions/hub.fish
mkdir ~/.config/alacritty
ln -sf ~/dotfiles/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
mkdir ~/my_bin
ln -sf ~/dotfiles/my_bin/delete_git_file ~/my_bin/delete_git_file

if test (uname) = "Linux"
  ln -sf ~/dotfiles/.xinitrc ~/.xinitrc
  ln -sf ~/dotfiles/.Xresources ~/.Xresources
  ln -sf ~/dotfiles/.xsession ~/.xsession
  ln -sf ~/dotfiles/.xmodmap ~/.xmodmap
  ln -sf ~/dotfiles/.xkeysnail.config.py ~/.xkeysnail.config.py
end

mkdir ~/.vim/tmp/; and chmod 777 $_
