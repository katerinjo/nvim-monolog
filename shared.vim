"" *****************************************************************************
"" vvv General vvv

"" Appearance
set ruler
set wrap
set linebreak
set background=dark

"" Cursor
" highlight Cursor guifg=NONE guibg=#00E000
" set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
"  \,a:Cursor/lCursor

"" Keyboard Shortcuts
let mapleader=' '
let maplocalleader='\'
set timeoutlen=2500

"" Tab Defaults
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

"" Searching
nnoremap / /\v
vnoremap / /\v
set gdefault
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Shell
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

"" Encoding
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Mouse
set mousemodel=extend
set mouse=a

"" ^^^ General ^^^
"" *****************************************************************************
"" vvv Key Bindings vvv

"" Navigation

" easier to escape the help buffer
autocmd FileType help noremap <buffer> q :q<cr>

" always move visually
noremap <Up>   gk
noremap <Down> gj
noremap k   gk
noremap j gj

"" Editing

" stay in visual mode after shifting
vmap < <gv
vmap > >gv

" use system clipboard (but not for 'x' deletions)
nnoremap y "+y
nnoremap p "+p
nnoremap d "+d
vnoremap y "+y
vnoremap p "+p
vnoremap d "+d

"" Insertion Modes (i | C-i)

" helper commands
command -nargs=1 InsLang set keymap=<args> | set guicursor=a:blinkwait200-blinkon50-blinkoff50
command -nargs=0 NoInsLang set keymap= | set guicursor=a:blinkon0
command -nargs=0 Langs echo "Esperanto\nIPA\nKana\nPinyin\nSmallCaps\nSuper"

" Normal (n : nor)
nnoremap <Leader>in :NoInsLang<CR>
noremap <C-i>n :NoInsLang<CR>
inoremap <C-i>n <Esc>:NoInsLang<CR>a
nnoremap <Leader>Inor :NoInsLang<CR>:echo "Normal (n)"<CR>

" Esperanto (e : esp)
nnoremap <Leader>ie :InsLang Esperanto<CR>
noremap <C-i>n :InsLang Esperanto<CR>
inoremap <C-i>e <Esc>:InsLang Esperanto<CR>a
nnoremap <Leader>Iesp :InsLang Esperanto <CR>:echo "Esperanto (e)"<CR>

" IPA (i : ipa)
nnoremap <Leader>ii :InsLang IPA<CR>
noremap <C-i>n :InsLang IPA<CR>
inoremap <C-i>i <Esc>:InsLang IPA<CR>a
nnoremap <Leader>Iipa :InsLang IPA<CR>:echo "IPA (i)"<CR>

" Kana (k : kan)
nnoremap <Leader>ik :InsLang kana<CR>
noremap <C-i>n :InsLang kana<CR>
inoremap <C-i>k <Esc>:InsLang kana<CR>a
nnoremap <Leader>Ikan :InsLang kana<CR>:echo "Kana (k)"<CR>

" Pinyin (y : pin)
nnoremap <Leader>iy :InsLang Pinyin<CR>
noremap <C-i>n :InsLang Pinyin<CR>
inoremap <C-i>y <Esc>:InsLang Pinyin<CR>a
nnoremap <Leader>Ipin :InsLang Pinyin<CR>:echo "Pinyin (y)"<CR>

" SmallCaps (s : cap sma)
nnoremap <Leader>is :InsLang SmallCaps<CR>
noremap <C-i>n :InsLang SmallCaps<CR>
inoremap <C-i>s <Esc>:InsLang SmallCaps<CR>a
nnoremap <Leader>Icap :InsLang SmallCaps<CR>:echo "SmallCaps (s)"<CR>
nnoremap <Leader>Isma :InsLang SmallCaps<CR>:echo "SmallCaps (s)"<CR>

" Super (p : sup)
nnoremap <Leader>ip :InsLang Super<CR>
noremap <C-i>n :InsLang Super<CR>
inoremap <C-i>p <Esc>:InsLang Super<CR>a
nnoremap <Leader>Isup :InsLang Super<CR>:echo "Super (i)"<CR>

"" Transformations (t)

" Rotated (r)
vnoremap tr !~/.config/nvim/utils/rotate.py<CR>
noremap <Leader>tr !!~/.config/nvim/utils/rotate.py<CR>

"" ^^^ Key Bindings ^^^
"" *****************************************************************************
"" vvv Debugging vvv


nnoremap <Leader>? :echo 'Loaded'<CR>
