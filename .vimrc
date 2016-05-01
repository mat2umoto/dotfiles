" Plugin
" プラグインを読み込む場合はここに記述する。

" Encode
" 下記の指定は環境によって文字化けする可能性があるので適宜変更する
set encoding=UTF-8		" 文字コードをUTF-8にする
set fileencoding=UTF-8	" 文字コードをUTF-8にする
set termencoding=UTF-8	" 文字コードをUTF-8にする

" File
set hidden		" ファイル変更中でも他のファイルを開けるようにする
set autoread	" ファイル内容が変更されると自動読み込みする

"Backup
if has('win32')
	set backupdir=$VIM/backup			" バックアップディレクトリを指定する
	set browsedir=buffer				" ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
	set directory=$VIM/backup,c:\temp	" スワップファイルディレクトリを指定する
	set history=1000					" 履歴保存数
endif

" Search
set incsearch	" インクリメンタルサーチを行う
set hlsearch	" 検索結果をハイライトする
set ignorecase	" 検索時に文字の大小を区別しない
set smartcase	" 検索時に大文字を含んでいたら大小を区別する
set wrapscan	" 検索をファイルの先頭へループする

" Input
set cindent							" C言語のインデントに従って自動インデントを行う
set shiftwidth=4					" 行頭での<Tab>の幅
set tabstop=4						" 行頭以外での<Tab>の幅
"set expandtab						" <Tab>の代わりに<Space>を挿入する
"set softtabstop=4					" expandtabで<Tab>が対応する<Space>の数
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]		" カーソルを行頭、行末で止まらないようにする
set clipboard=unnamed				" クリップボードを利用する

"" Dvorak用にhtで左右移動するようRemap
"noremap  t     l

"" 挿入モード中に'Ctr-*'でコマンドモードでの移動を可能にする
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

" 空白文字を表示
set list    "タブ、行末等の不可視文字を表示する
"set listchars=tab:> ,trail:_,eol:$
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

scriptencoding utf-8			"これ入れないと下記が反映されない
augroup highlightZenkakuSpace	"全角スペースを赤色にする
  autocmd!
  autocmd VimEnter,ColorScheme * highlight ZenkakuSpace term=underline ctermbg=Gray guibg=Gray
  autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END

" IME状態に応じたカーソル色を設定
function! s:CursorColor()
    highlight Cursor guifg=NONE guibg=White
    highlight CursorIM guifg=NONE guibg=Red
endfunction

augroup ColorSchemeHook
    autocmd!
    autocmd ColorScheme * call s:CursorColor()
augroup END

" ノーマルモードに戻る際にIMEをOFF
if has('win32')
	augroup InsModeAu
		autocmd!
		autocmd InsertEnter,CmdwinEnter * set noimdisable
		autocmd InsertLeave,CmdwinLeave * set imdisable
	augroup END
endif
if has('unix')
	function! ImInActivate()
		call system('fcitx-remote -c')
	endfunction
	inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
endif

" 挿入モードに入る際にIMEをOFF
set iminsert=0
set imsearch=-1	" 検索モード時も合わせる

