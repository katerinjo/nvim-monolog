"" *****************************************************************************
"" vvv General vvv

"" Shared Config
ru shared.vim

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

" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

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
