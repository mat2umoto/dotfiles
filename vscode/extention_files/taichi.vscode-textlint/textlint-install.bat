@echo off

rem ユーザーディレクトリへ移動
rem cd %userprofile%

rem textlint本体とルールをカレントへインストール
call npm i textlint
rem *****************************************************
rem ルール：技術文書
call npm i textlint-rule-preset-ja-technical-writing
rem ルール：スペース挿入
call npm i textlint-rule-preset-ja-spacing
rem *****************************************************

rem textlintのプロジェクトを初期化
call .\node_modules\.bin\textlint --init

set rcfilebase=.textlintrc.base
set rcfile=.textlintrc

rem textlintのrcファイルを設定済みのものに置き換える
if exist %rcfile% del %rcfile%
copy %rcfilebase% %rcfile%

pause
