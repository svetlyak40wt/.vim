so ~/.vim/develop.vim

" удобная вставка set_trace
nnoremap <Leader><Leader> oimport pdb;pdb.set_trace()<ESC>
inoremap <Leader><Leader> import pdb;pdb.set_trace()<ESC>
