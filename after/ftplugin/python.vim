" Отключаем перенос строк
setlocal nowrap

" Уровень сокрытия по умолчанию для вновь открытых файлов
setlocal foldlevelstart=0
" Метод фолдинга - по синтаксису
setlocal foldmethod=syntax

" Включаем отображение номеров строк
setlocal number

" Учитывать регистр букв при поиске
setlocal noignorecase

" Включить подсветку невидимых символов
setlocal list

" удобная вставка set_trace
nnoremap <Leader><Leader> oimport pdb;pdb.set_trace()<ESC>
inoremap <Leader><Leader> import pdb;pdb.set_trace()<ESC>
