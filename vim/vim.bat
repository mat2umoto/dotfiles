@echo off
rem 管理者として実行すること


rem 管理者として実行したときのための、カレントディレクトリ設定
cd /d %~dp0
set curpath=%~dp0

rem vim設定ファイルのシンボリックリンク
mklink %USERPROFILE%\.vimrc %curpath%.vimrc
mklink %USERPROFILE%\.gvimrc %curpath%.gvimrc
mkdir %USERPROFILE%\vimfiles

rem mklink /d %USERPROFILE%\vimfiles\colors 
mkdir %USERPROFILE%\vimfiles\colors
copy %curpath%colors\* %USERPROFILE%\vimfiles\colors\

rem neobundle.vimのインストール
mkdir %USERPROFILE%\vimfiles\bundle
mkdir %USERPROFILE%\vimfiles\bundle\neobundle.vim
git clone https://github.com/Shougo/neobundle.vim.git %USERPROFILE%\vimfiles\bundle\neobundle.vim

pause
