"" *****************************************************************************
"" vvv General vvv

"" Appearance
set ruler
set wrap
set linebreak
set background=dark

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


call plug#end()

"" ^^^ PlugIns ^^^
"" *****************************************************************************
"" vvv PlugIn-Dependent Settings vvv



"" ^^^ PlugIn-Dependent Settings ^^^
"" *****************************************************************************
"" vvv Commands / Functions vvv

" show unicode info
nnoremap <Leader>u :.w !uniname<CR>

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

" keymap helper commands
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

" use system clipboard
set clipboard=unnamedplus

"" Characters

inoremap <S-Tab> <C-k>HT
digraphs !? 8253
digraphs ~~ 8776
digraphs ?! 11800

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
"" vvv Transformations vvv

" Smart Sorted (A)
vnoremap tA !sort<CR>
noremap <Leader>tA !!sort<CR>

" Brute Sorted (a)
vnoremap ta !LC_ALL=C sort<CR>
noremap <Leader>ta !!LC_ALL=C sort<CR>

"" ^^^ Transformations ^^^
"" *****************************************************************************
"" vvv Generated Commands vvv

runtime cmdtree.vim
