" インサートモードでのキーマップ
inoremap jk <ESC>

nnoremap j gj
nnoremap k gk

"mapleaderの設定
let mapleader = "\<Space>"


" クリップボードとyankの紐付け
set clipboard&
set clipboard^=unnamedplus


" 画面表示設定
:set relativenumber "横に行番号を付与
set showcmd "右下に入力中のコマンドが表示
filetype plugin indent on "ファイル形式別にindentをオンにする 
set ambiwidth=double "文字幅を2つ分にする
set wrap "文字を画面端で折り返し


" ファイル処理関連
set nobackup " backupを作らないように
set noswapfile " swpファイルを作成しない
set autoread " 外部で変更された場合は読み込みし直す 
set hidden "保存されていないファイルがあっても別ファイルを開ける
set encoding=utf-8 "utf-8を読み込み
set fenc=utf-8 "保存時に文字コードをutf-8にする 

" 操作系
set virtualedit=onemore "行末の1つ先までカーソルを進める
set smartindent "改行時にインデントをいい感じにする 
set showmatch "かっこの入力時に対応部分に飛ぶ 
set wildmode=list:longest "ファイルを開く時の補完を設定
syntax enable "ハイライトON

set expandtab "タブ入力を複数の空白に置き換える
set tabstop=4 "タブの空白数
set shiftwidth=2 "自動インデントでずれる幅
set belloff=all "音を消す


" 検索系
set ignorecase "大文字小文字を区別しないで検索
set smartcase "大文字があれば区別して検索
set incsearch "入力中の文字列に合わせて移動する
set wrapscan "最後尾まで検索したらトップに戻る
set hlsearch "検索文字列のハイライト
map <ESC><ESC> :nohlsearch<CR><ESC>


" dein.vim settings {{{
" install dir {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" }}}

" dein installation check {{{
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif
" }}}

" begin settings {{{
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

  " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  " end settings
  call dein#end()
  call dein#save_state()
endif
" }}}

" plugin installation check {{{
if dein#check_install()
  call dein#install()
endif
" }}}

" plugin remove check {{{
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

set helplang=ja
