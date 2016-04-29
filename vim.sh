#!/bin/sh

# vim設定ファイルのシンボリックリンク 相対パスだとうまくいかないので停止
#ln -fs ./.vimrc ~
#ln -fs ./.gvimrc ~
#mkdir ~/.vim
#mkdir ~/.vim/colors
#ln -fs ./colors/jellybeans.vim ~/.vim/colors

# とりあえずコピー
cp ./.vimrc ~
cp ./.gvimrc ~
mkdir ~/.vim
mkdir ~/.vim/colors
cp ./colors/jellybeans.vim ~/.vim/colors
