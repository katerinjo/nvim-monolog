ru shared.vim

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'vim-airline/vim-airline'

call plug#end()

cnoreabbrev w wq
cnoreabbrev q wq
nnoremap <leader>s :wq<CR>
noremap <C-s> <Esc>:wq<CR>
inoremap <C-s> <Esc>:wq<CR>

