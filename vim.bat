rem @echo off

rem 管理者として実行したときのための、カレントディレクトリ設定
cd /d %~dp0
set curpath=%~dp0

rem vim設定ファイルのシンボリックリンク
mklink %USERPROFILE%\.vimrc %curpath%.vimrc
mklink %USERPROFILE%\.gvimrc %curpath%.gvimrc
mkdir %USERPROFILE%\vimfiles
mklink /d %USERPROFILE%\vimfiles\colors %curpath%colors
pause
