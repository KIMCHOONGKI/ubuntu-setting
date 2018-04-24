set incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set smartindent
set wrap
set nowrapscan
set nobackup
set tabstop=4
set shiftwidth=4
"set number
set hlsearch
set autoindent
set ruler
set et
set ignorecase
set background=light

set mp=gcc\ %
set bs=indent,eol,start
filetype plugin indent on

syntax on

"if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" || v:lang =~ "UTF8"
"         set encoding=utf-8
"         set fileencodings=cp949
"endif

set showmatch
set title

"set encoding=utf-8
"set encoding=euc-kr
"set termencoding=euc-kr
"set fileencoding=euc-kr

map <F2>        :Exp<CR>
map <F3>        [i
map <F4>        <C-W>i
map <F5>        v]}zf
map <F6>        zo
map <F7>        :sp<CR>
map <F8>        :vs<CR>
map <F9>        :Tlist<CR>
map <F10>       :q!
map <F11>       :wq
map <F12>       :wq!"

map <C-J>       <C-W>j<C-W>_
map <C-K>       <C-W>k<C-W>_
map <C-H>       <C-W>h<C-W><BAR>
map <C-L>       <C-W>l<C-W><BAR>

let &titleold=getcwd()

set tags=./tags

