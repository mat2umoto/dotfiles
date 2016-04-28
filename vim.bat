rem @echo off

rem 管理者として実行したときのための、カレントディレクトリ設定
cd /d %~dp0

rem vim設定ファイルのシンボリックリンク
mklink %HOMEPATH%\.vimrc .\.vimrc
mklink %HOMEPATH%\.gvimrc .\.gvimrc
mkdir %HOMEPATH%\vimfiles
mkdir %HOMEPATH%\vimfiles\colors
mklink %HOMEPATH%\vimfiles\colors\jellybeans.vim .\colors\jellybeans.vim
pause
