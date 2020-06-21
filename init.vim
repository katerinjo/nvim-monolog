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

"" Visual
syntax on
set number

""
"" *****************************************************************************
"" vvv PlugIns vvv
call plug#begin(expand('~/.config/nvim/plugged'))

"" General

"" Presentation

Plug 'vim-airline/vim-airline'

" color schemes
Plug 'nanotech/jellybeans.vim'

"" Function

Plug 'w0rp/ale' " linting engine
Plug 'tpope/vim-commentary' " gcc for commenting out lines

" snippets

" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'sirver/UltiSnips'

"" Clojure
Plug 'Olical/conjure', { 'tag': 'v2.1.2', 'do': 'bin/compile' }

call plug#end()

"" ^^^ PlugIns ^^^
"" *****************************************************************************
"" vvv PlugIn-Dependent Settings vvv

"" Ale
let g:ale_linters = {
    \ 'clojure': ['clj-kondo', 'joker']
    \}

"" Clojure
let g:conjure_log_direction = "horizontal"

"" Misc

silent! colorscheme jellybeans

" status bar always
set laststatus=2

"" ^^^ PlugIn-Dependent Settings ^^^
"" *****************************************************************************
"" vvv Commands / Functions vvv

" show unicode info
nnoremap <Leader>u :.w !uniname<CR>

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" keymap helper commands
command -nargs=1 InsLang set keymap=<args> | set guicursor=a:blinkwait200-blinkon50-blinkoff50
command -nargs=0 NoInsLang set keymap= | set guicursor=a:blinkon0
command -nargs=0 Langs echo "Esperanto\nIPA\nKana\nPinyin\nSmallCaps\nSuper"

"" ^^^ Commands / Functions ^^^
"" *****************************************************************************
"" vvv Key Bindings vvv

"" Search
" center on each item arrived at in search
nnoremap n nzzzv
nnoremap N Nzzzv

"" Quitting & Saving
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
noremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap <leader>s :w<CR>

"" Navigation

" easier tab-jumping
nnoremap <Tab> gt
nnoremap <S-Tab> gT

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

"" Characters

inoremap <S-Tab> <C-k>HT
digraphs !? 8253
digraphs ~~ 8776
digraphs ?! 11800
digraphs Tg 9895

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Window Navigation
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

"" ^^^ Key Bindings ^^^
"" *****************************************************************************
"" vvv Keymaps vvv

" Normal (n : nor)
nnoremap <Leader>in :NoInsLang<CR>
noremap <C-i>n :NoInsLang<CR>
nnoremap <Leader>Inor :NoInsLang<CR>:echo "Normal (n)"<CR>

" Esperanto (e : esp)
nnoremap <Leader>ie :InsLang Esperanto<CR>
noremap <C-i>n :InsLang Esperanto<CR>
nnoremap <Leader>Iesp :InsLang Esperanto <CR>:echo "Esperanto (e)"<CR>

" IPA (i : ipa)
nnoremap <Leader>ii :InsLang IPA<CR>
noremap <C-i>n :InsLang IPA<CR>
nnoremap <Leader>Iipa :InsLang IPA<CR>:echo "IPA (i)"<CR>

" Kana (k : kan)
nnoremap <Leader>ik :InsLang kana<CR>
noremap <C-i>n :InsLang kana<CR>
nnoremap <Leader>Ikan :InsLang kana<CR>:echo "Kana (k)"<CR>

" Pinyin (y : pin)
nnoremap <Leader>iy :InsLang Pinyin<CR>
noremap <C-i>n :InsLang Pinyin<CR>
nnoremap <Leader>Ipin :InsLang Pinyin<CR>:echo "Pinyin (y)"<CR>

" SmallCaps (s : cap sma)
nnoremap <Leader>is :InsLang SmallCaps<CR>
noremap <C-i>n :InsLang SmallCaps<CR>
nnoremap <Leader>Icap :InsLang SmallCaps<CR>:echo "SmallCaps (s)"<CR>
nnoremap <Leader>Isma :InsLang SmallCaps<CR>:echo "SmallCaps (s)"<CR>
nnoremap <Leader>Iupp :InsLang SmallCaps<CR>:echo "SmallCaps (s)"<CR>

" Super (p : sup)
nnoremap <Leader>ip :InsLang Super<CR>
noremap <C-i>n :InsLang Super<CR>
nnoremap <Leader>Isup :InsLang Super<CR>:echo "Super (i)"<CR>

"" ^^^ Keymaps ^^^
"" *****************************************************************************
"" vvv Transformations vvv

" Rotated (r)
vnoremap tr !~/.config/nvim/utils/rotate.py<CR>
noremap <Leader>tr !!~/.config/nvim/utils/rotate.py<CR>

" Brute Sorted (a)
vnoremap ta !LC_ALL=C sort<CR>
noremap <Leader>ta !!LC_ALL=C sort<CR>

" Smart Sorted (A)
vnoremap tA !sort<CR>
noremap <Leader>tA !!sort<CR>

" Studly Caps (S)
vnoremap tS !~/.config/nvim/utils/studly.py<CR>
noremap <Leader>tS !!~/.config/nvim/utils/studly.py<CR>
