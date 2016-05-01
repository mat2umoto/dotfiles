rem @echo off

rem 管理者として実行したときのための、カレントディレクトリ設定
cd /d %~dp0
set curpath=%~dp0

rem vim設定ファイルのシンボリックリンク
mklink %USERPROFILE%\.vimrc %curpath%.vimrc
mklink %USERPROFILE%\.gvimrc %curpath%.gvimrc
mkdir %USERPROFILE%\vimfiles
rem mklink /d %USERPROFILE%\vimfiles\colors %curpath%colors
mklink /d %USERPROFILE%\vimfiles\bundle %curpath%bundle
pause
