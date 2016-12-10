"カラースキームの設定
syntax on
set background=dark
colorscheme hybrid

" 行番号表示
set number
" カーソルが何行目の何列目にあるか表示
set ruler
" タブや空白を可視化
set list
" タブや空白を可視化
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
"行番号をハイライト
set cursorline
"cursorlineの色を付けないように設定
hi clear CursorLine
" 文字を入力タイミングからリアルタイムで検索してくれる
set incsearch
" 検索結果をハイライトする
set hlsearch
" 対応する括弧を強調して表示
set showmatch
" 行頭行末でのカーソル移動
set whichwrap=h,l
" 文字列の検索時に大文字と小文字を区別しないで検索
set ignorecase
" 小文字で検索した時は区別しなくなります。
set smartcase
" tabを4つスペース分に設定
set tabstop=4
" <<>>を入力した時に挿入されるtabがスペースいくつ分かを設定
set shiftwidth=4
" ペーストする時にインデントさせない。
set paste
" 隠れバッファ
set hidden
" 下のラインを2行にする
set statusline=2
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

"----------------------------------------------------
" GNU GLOBAL(gtags)
"----------------------------------------------------
"ウィンドウを閉じる
nmap <C-q> <C-w><C-w><C-w>q
"ソースコードのgrep
nmap <C-g> :Gtags -g
"このファイルの関数一覧
nmap <C-l> :Gtags -f %<CR>
"カーソル以下の定義元を探す
nmap <C-j> :Gtags <C-r><C-w><CR>
"カーソル以下の使用箇所を探す
nmap <C-k> :Gtags -r <C-r><C-w><CR>
"次の検索結果へジャンプする
nmap <C-n> :cn<CR>
"前の検索結果へジャンプする
nmap <C-p> :cp<CR>

