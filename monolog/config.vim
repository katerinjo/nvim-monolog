ru shared.vim

call plug#begin(expand('~/.config/nvim/plugged'))

Plug 'vim-airline/vim-airline'

call plug#end()

function MonologOut()
  write !~/.config/nvim/monolog/spit.sh >/dev/null 2>&1 &
  quit!
endfunction

nnoremap <leader>s :call MonologOut()<CR>
noremap <C-s> <Esc>:call MonologOut()<CR>
inoremap <C-s> <Esc>:call MonologOut()<CR>
noremap <localleader>r :%!~/.config/nvim/utils/rotate.py<CR>
\ :call MonologOut()<CR>
