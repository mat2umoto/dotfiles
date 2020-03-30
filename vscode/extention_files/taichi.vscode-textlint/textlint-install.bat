@echo off

rem ユーザーディレクトリへ移動
rem cd %userprofile%

rem 管理者権限で起動した場合のカレントディレクトリ設定
cd %~dp0

rem textlint本体をカレントへインストール
echo ****************************************************
echo initialize Node.js project
echo ****************************************************
call npm init --yes

rem textlint本体をカレントへインストール
echo ****************************************************
echo install textlint
echo ****************************************************
call npm i textlint

rem ルールをインストール：技術文書
echo ****************************************************
echo install textlint-rule-preset-ja-technical-writing
echo ****************************************************
call npm i textlint-rule-preset-ja-technical-writing
echo;

rem ルールをインストール：スペース挿入
echo ****************************************************
echo install textlint-rule-preset-ja-spacing
echo ****************************************************
call npm i textlint-rule-preset-ja-spacing
echo;

rem フィルタをインストール：ホワイトリスト除外機能
echo ****************************************************
echo install textlint-filter-rule-whitelist
echo ****************************************************
call npm i textlint-filter-rule-whitelist
echo;

rem textlintのプロジェクトを初期化
echo ****************************************************
echo initialize textlint
echo ****************************************************
call .\node_modules\.bin\textlint --init
echo;

set rcfilebase=.textlintrc.base
set rcfile=.textlintrc

rem textlintのrcファイルを設定済みのものに置き換える
echo ****************************************************
echo make .textlintrc
echo ****************************************************
if exist %rcfile% del %rcfile%
copy %rcfilebase% %rcfile%
echo;

pause
