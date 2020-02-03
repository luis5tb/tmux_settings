#!/bin/sh

#sudo yum install -y epel-release
sudo yum install -y vim vim-enhanced ctags unzip python-flake8

# uncomment if fedora
sudo dnf install powerline powerline-fonts tmux-powerline vim-powerline

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# backup any old vim file
rm -rf ~/.vimrc.old
[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.old

rm -rf ~/.bashrc.old
[ -f ~/.bashrc ] && mv ~/.bashrc ~/.bashrc.old

rm -rf ~/.tmux.conf.old
[ -f ~/.tmux.conf ] && mv ~/.tmux.conf ~/.tmux.conf.old

rm -rf ~/.tmux_line.conf.old
[ -f ~/.tmux_line.conf ] && mv ~/.tmux_line.conf ~/.tmux_line.conf.old

# install Vundle
[ -d ~/.vim ] || mkdir ~/.vim
[ -d ~/.vim/bundle/Vundle.vim ] || \
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# link my base config
ln -s $DIR/.vimrc ~/.vimrc
ln -s $DIR/.tmux_line.conf ~/.tmux_line.conf
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/.bashrc ~/.bashrc

# install plugins with Vundle
vim +PluginInstall +qall

git config --global gitreview.username ltomasbo
git config --global user.name "Luis Tomas Bolivar"
git config --global user.email "ltomasbo@redhat.com"
git config --global core.editor vim

