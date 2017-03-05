"カラースキームの設定
syntax on
set background=dark
colorscheme hybrid

"----------------------------------------------------
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
" 画面上でタブ文字が締める幅
set tabstop=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
"set softtabstop=4
" 改行時に前のインデントを継承する
set autoindent
" autoindent時にインデントする文字数
set shiftwidth=2 
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" tabを4つスペース分に設定
set tabstop=2
" <<>>を入力した時に挿入されるtabがスペースいくつ分かを設定
set shiftwidth=2
" ペーストする時にインデントさせない。
" set paste
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
" アンドゥファイルの生成を止める 
set noundofile
" エディタ上にタブバーを表示する設定(0 = 常に非表示 1 = 複数の時にタブ表示 2 = 常に表示)
set showtabline=2

"---------------------------------------------------
"キー割り当て
"---------------------------------------------------
" ウィンドウを閉じる
nmap <C-q> <C-w><C-w><C-w>q
" 次の検索結果へジャンプする
nmap <C-n> :cn<CR>
" 前の検索結果へジャンプする
nmap <C-p> :cp<CR>

"tab移動
map <S-o> :tab ba<CR>
map <Left> :tabp<CR>
map <Right> :tabn<CR>

"----------------------------------------------------
" コマンド補完
"----------------------------------------------------
" 括弧を補完
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"---------------------------------------------------
"ctags
"---------------------------------------------------
"適当なソースをvimで開いて、トップに生成されたtagsファイルへパスを通す
"todo:使い方分からず
"set tags=/usr/local/repository/crow


"----------------------------------------------------
" GNU GLOBAL(gtags)
"----------------------------------------------------
" ソースコードのgrep
nmap <C-g> :Gtags -g
" このファイルの関数一覧
nmap <C-l> :Gtags -f %<CR>
" カーソル以下の定義元を探す
nmap <C-j> :Gtags <C-r><C-w><CR>
" カーソル以下の使用箇所を探す
nmap <C-k> :Gtags -r <C-r><C-w><CR>

"-----------------------------------------------------
"dein.vim
"-----------------------------------------------------
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/Kyog02/dotfiles/.vim/dein//repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/Kyog02/dotfiles/.vim/dein/')
  call dein#begin('/Users/Kyog02/dotfiles/.vim/dein/')
" Let dein manage dein
" Required:
  call dein#add('/Users/Kyog02/dotfiles/.vim/dein//repos/github.com/Shougo/dein.vim')
" Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
" You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Add Plugins
  call dein#add('scrooloose/nerdtree')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimproc.vim', {'build': 'make'})
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('justmao945/vim-clang')
  call dein#add('kana/vim-operator-user')
  call dein#add('rhysd/vim-clang-format')
  call dein#add('thinca/vim-quickrun')

" Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts---------------------------

"========================================================
"プラグインの設定
"=========================================================

"-----------------------------------------
"NERDTREE
"-----------------------------------------
"vim起動時にNERDTREEを起動
"autocmd VimEnter * execute 'NERDTree'

"起動時は、エディタ側にカーソルを合わせる
function s:MoveToFileAtStart()
  call feedkeys("\<C-w>")  "タブ移動
  call feedkeys("\<C-l>")  "右側のタブに移動
endfunction
"autocmd VimEnter *  NERDTree | call s:MoveToFileAtStart()

"他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"隠しファイルの表示
let NERDTreeShowHidden = 1

"----------------------------------------------
"Unite.vim
"---------------------------------------------
"インサートモードで開始(0 = OFF, 1 = ON)
let g:unite_enable_start_insert=0
"ヒストリー/ヤンク機能を有効化
let g:unite_source_history_yank_enable =1
"prefix keyの設定
nmap <Space> [unite]
" matcher をデフォルトにする(ドットファイル表示する)
call unite#custom#source('file', 'matchers', "matcher_default")

"スペースキーとaキーでカレントディレクトリを表示
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"スペースキーとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>
"スペースキーとdキーで最近開いたディレクトリを表示
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory_mru<CR>
"スペースキーとbキーでバッファを表示
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
"スペースキーとrキーでレジストリを表示
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>
"スペースキーとtキーでタブを表示
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>
"スペースキーとhキーでヒストリ/ヤンクを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
"スペースキーとoキーでoutline
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>
"スペースキーとENTERキーでfile_rec:!
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>
"unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{
    " ESCでuniteを終了
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction"}

"-----------------------------------------
"NeoCompleate.vim
"-----------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
	"return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.\t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

"-----------------------------------------
"vim-Clang
"-----------------------------------------
" set clang options for vim-clang
let g:clang_c_options = '-std=c11'
let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'

"-----------------------------------------
"Formatter
"-----------------------------------------
map ,x <Plug>(operator-clang-format))

"-----------------------------------------
"quickrun
"-----------------------------------------
"let g:quickrun_config = get(g:, 'quickrun_config', {})
" vimproc を使って非同期に実行し，結果を quickfix に出力する
"let g:quickrun_config._ = {
"          \ 'outputter' : 'quickfix',
"          \ 'runner' : 'vimproc'
"         \ }

"全ての出力バッファをウィンドウ下の幅8spで出力。出力がなかった場合は出力
"バッファを閉じる。
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright 8sp", 
\       "outputter/buffer/close_on_empty" : 1 
\   },
\}

"c++はclang++(c++1y)で実行
let g:quickrun_config.cpp = {
         \ 'command' : 'clang++',
         \ 'cmdopt' : '-std=c++1y -Wall -Wextra',
         \ }
"todo:Boostライブラリ使用する場合はquickrunex-vimを使用する
