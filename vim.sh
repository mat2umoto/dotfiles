#!/bin/sh

# vim設定ファイルのシンボリックリンク 相対パスだとうまくいかないので停止
#ln -fs $(readlink -f ./.vimrc) ~
#ln -fs $(readlink -f ./.gvimrc) ~
#mkdir ~/.vim
#mkdir ~/.vim/colors
##ln -fs $(readlink -f ./colors/jellybeans.vim) ~/.vim/colors
#ln -fs $(readlink -f ./bundle) ~/.vim/bundle

# とりあえずコピー
cp ./.vimrc ~
cp ./.gvimrc ~
mkdir ~/.vim
#mkdir ~/.vim/colors
#cp ./colors/jellybeans.vim ~/.vim/colors
mkdir ~/.vim/bundle
cp ./colors/jellybeans.vim ~/.vim/bundle
