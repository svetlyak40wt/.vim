" Запрещаем восстановление настроек из сессии,
" т. к. тогда при изменении ~/.vimrc даже после
" перезагрузки IDE новые настройки не будут
" вступать в силу.
set sessionoptions-=options

" При закрытии Vim'а сохраняем информацию о текущей сессии
au VimLeave * :mksession! .vim/ide.session

" Загружаем ранее сохраненную сессию -->
if getfsize(".vim/ide.session") >= 0 && argc() == 0
    source .vim/ide.session
endif
