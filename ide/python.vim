" Конфигурационный файл Vim IDE
" (http://habrahabr.ru/blog/vim/47805.html)
so ~/.vim/ide/common.vim


function! MyUpdateIdeCtags()
    silent !ctags --languages=Python -f ctags --tag-relative=no -R . > /dev/null 2>&1
endfunction

let MyUpdateCtagsFunction = "MyUpdateIdeCtags"
" Настраиваем работу с ctags <--

" Обновляем базу ctags при старте IDE
call {MyUpdateCtagsFunction}()

" При сохранении любого *.py файла обновляем базу ctags
au BufWritePost *.py :call {MyUpdateCtagsFunction}()

" Просим NERD tree игнорировать файлы
let NERDTreeIgnore=['\.pyo', '\.pyc', '\.egg-info', '-stamp', 'develop-eggs', 'dist', 'bin', 'build', 'parts', '_trial_temp', 'ctags', ',cover']

" Будем использовать юнит-тесты
compiler pyunit
