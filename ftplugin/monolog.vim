function MonologOut()
  write !~/.config/nvim/monolog/spit.sh >/dev/null 2>&1 &
  quit!
endfunction

cnoreabbrev <expr>
  \ w getcmdtype() == ":" && getcmdline() == 'w' ? 'call MonologOut()' : 'w'
cnoreabbrev <expr>
  \ wq getcmdtype() == ":" && getcmdline() == 'wq' ? 'call MonologOut()' : 'wq'
nnoremap <leader>s :call MonologOut()<CR>
noremap <C-s> <Esc>:call MonologOut()<CR>
inoremap <C-s> <Esc>:call MonologOut()<CR>

" Rotated
noremap <localleader>r :%!~/.config/nvim/utils/rotate.py<CR>
  \ :call MonologOut()<CR>

" Italic
noremap <localleader>I :%!~/.config/nvim/utils/italic.py<CR>
  \ :call MonologOut()<CR>

" Brute Sorted
noremap <localleader>a :%!LC_ALL=C sort<CR>
  \ :call MonologOut()<CR>

" Smart Sorted
noremap <localleader>A :%!sort<CR>
  \ :call MonologOut()<CR>

" Studly Caps
noremap <localleader>S :%!~/.config/nvim/utils/studly.py<CR>
  \ :call MonologOut()<CR>

" Small Caps
noremap <localleader>s :%!~/.config/nvim/utils/smallcaps.py<CR>
  \ :call MonologOut()<CR>
