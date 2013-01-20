" ---------------------------------
"  Включаем менеджер пакетов
" ---------------------------------

let g:addons = ['snipmate-snippets', 'Solarized', 'surround', 'fugitive', 'listmaps', 'cscope', 'github:scrooloose/nerdtree', 'ack', 'nerdtree-ack', 'tComment', 'matchit.zip', 'sparkup', 'Syntastic', 'unimpaired', 'github:svetlyak40wt/vim-local-settings', 'FuzzyFinder', 'slimv']

" Перенастраиваем хоткеи для Lisp
" let g:paredit_leader = '\'
let g:slimv_leader = '\'

source ~/.vim/install-addons.vim

" --------------------------------
" Misc options
" --------------------------------

let mapleader = ","
let maplocalleader = "\\"

" подсветка синтаксиса
syntax enable
" цветовая схема
set background=light
color solarized
set guifont=Monaco:h14
" подсветка скобок
set showmatch

" подсветка результатов поиска
set hlsearch
set incsearch
" Игнорировать регистр букв при поиске
set ignorecase

" Включает виртуальный звонок (моргает, а не бибикает при ошибках)
set visualbell
" всегда запускать тесты после компиляции
set makeprg=make\ check
" Метод фолдинга - вручную (для обычных файлов)
set foldmethod=manual
" Включаем мышку даже в текстовом режиме
" set mouse=a
" Всегда отображать статусную строку для каждого окна
set laststatus=2
" Опции автодополнения - включаем только меню с доступными вариантами
" автодополнения (также, например, для omni completion может быть
" окно предварительного просмотра).
set completeopt=menu
" Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
" К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
set showcmd

" Включаем отображение дополнительной информации в статусной строке
set statusline=%<%f " имя файла
set statusline+=%h%m%r " флаги Help, Modified, Readonly
set statusline+=%= " переходим к правой колонке

" ошибки от Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=\ %{fugitive#statusline()} " информация о репозитории
set statusline+=\ format=%{&fileformat} " формат файла
set statusline+=\ file=%{&fileencoding} " кодировка файла
set statusline+=\ enc=%{&encoding} " кодировка терминала
set statusline+=\ %l,%c%V " номер строки и номер колонки
set statusline+=\ %P " позиция в тексте, в процентах

" искать теги в следующих файлах
set tags=tags;/

" Клавиатура и выравнивание
" Нормальное удаление с помощью BackSpace
set bs=2
" настройка табуляции
set tabstop=4
set shiftwidth=4
set softtabstop=4

" все символы табуляции заменяются пробелами
set expandtab
" для Makfile оставлять знаки табуляции как есть
au FileType make setlocal noexpandtab

" Копирует отступ от предыдущей строки
set autoindent
" Включаем 'умную' автоматическую расстановку отступов
set smartindent
" Включаем перенос строк
set wrap
" Перенос строк по словам, а не по буквам
set linebreak
" знаки табуляции должны отображаться в виде ">---"
" а висячие пробелы "~"
set list listchars=tab:>-,trail:~
" разрешаем переопределять настройки в исходнике
set modeline

filetype plugin on

" Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
set whichwrap=b,s,<,>,[,],l,h

" --------------------------------
" Spelling
" --------------------------------

set spelllang=ru,en
set nospell
au FileType markdown nnoremap ,s :set spell!<CR><BAR>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" NERD Tree maps
nnoremap <silent> <LocalLeader><LocalLeader> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc', '\.egg-info', 'develop-eggs', 'dist', 'develop-eggs']

" Syntastic
" проверяем файл на ошибки во время открытия
let g:syntastic_check_on_open=1

" --------------------------------
" Fuzzy Finder
" --------------------------------
let g:fuf_modesDisable = []
let g:fuf_mrufile_maxItem = 400
let g:fuf_mrucmd_maxItem = 400
nnoremap <silent> sj     :FufBuffer<CR>
nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> sK     :FufFileWithFullCwd<CR>
nnoremap <silent> s<C-k> :FufFile<CR>
nnoremap <silent> sl     :FufCoverageFileChange<CR>
nnoremap <silent> sL     :FufCoverageFileChange<CR>
nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
nnoremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sn     :FufMruFile<CR>
nnoremap <silent> sN     :FufMruFileInCwd<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> su     :FufBookmarkFile<CR>
nnoremap <silent> s<C-u> :FufBookmarkFileAdd<CR>
vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> s<C-i> :FufBookmarkDirAdd<CR>
nnoremap <silent> st     :FufTag<CR>
nnoremap <silent> sT     :FufTag!<CR>
nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> s,     :FufBufferTag<CR>
nnoremap <silent> s<     :FufBufferTag!<CR>
vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
nnoremap <silent> s.     :FufBufferTagAll<CR>
nnoremap <silent> s>     :FufBufferTagAll!<CR>
vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
nnoremap <silent> sg     :FufTaggedFile<CR>
nnoremap <silent> sG     :FufTaggedFile!<CR>
nnoremap <silent> so     :FufJumpList<CR>
nnoremap <silent> sp     :FufChangeList<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
nnoremap <silent> sy     :FufLine<CR>
nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> se     :FufEditDataFile<CR>
nnoremap <silent> sr     :FufRenewCache<CR>

" --------------------------------
"  Mappings
" --------------------------------

" map ё `
" map й q
" map ц w
" map у e
" map к r
" map е t
" map н y
" map г u
" map ш i
" map щ o
" map з p
" map х [
" map ъ ]
" map ф a
" map ы s
" map в d
" map а f
" map п g
" map р h
" map о j
" map л k
" map д l
" map ж ;
" map э '
" map я z
" map ч x
" map с c
" map м v
" map и b
" map т n
" map ь m
" map б ,
" map ю .
" map Ё ~
" map Й Q
" map Ц W
" map У E
" map К R
" map Е T
" map Н Y
" map Г U
" map Ш I
" map Щ O
" map З P
" map Х {
" map Ъ }
" map Ф A
" map Ы S
" map В D
" map А F
" map П G
" map Р H
" map О J
" map Л K
" map Д L
" map Ж :
" map Э "
" map Я Z
" map Ч X
" map С C
" map М V
" map И B
" map Т N
" map Ь M
" map Б <
" map Ю >

" Переключение между языками
" https://gist.github.com/3748238
nnoremap <Leader>r :set keymap=russian-jcuken<CR>
nnoremap <Leader>e :set keymap=<CR>
inoremap <Leader>r <ESC>:set keymap=russian-jcuken<CR>a
inoremap <Leader>e <ESC>:set keymap=<CR>a


" Переключение между табами
nnoremap <Leader>1 :tabn 1 <CR>
nnoremap <Leader>2 :tabn 2 <CR>
nnoremap <Leader>3 :tabn 3 <CR>
nnoremap <Leader>4 :tabn 4 <CR>
nnoremap <Leader>5 :tabn 5 <CR>
nnoremap <Leader>6 :tabn 6 <CR>
nnoremap <Leader>t :tabnew <CR>
nnoremap <Leader>T :tabclose <CR>
" Переключение в шелл
nnoremap <Leader>z :sh <CR>

" Вставка даты
nnoremap <Leader>d "=strftime("%Y-%m-%d %H:%M:%S")<CR>P
inoremap <Leader>d <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" Learn VIm Script Hard Way
" http://learnvimscriptthehardway.stevelosh.com/chapters/01.html
" =========================
" Быстрое редактирование .vimrc
nnoremap <Leader>ev :split $MYVIMRC<CR>G4ki
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Быстрое перемещение на начало строки
nnoremap H 0w
" И её конец
nnoremap L $
" Выход из режима редактирования
inoremap jk <esc>
" Режим вставки
nnoremap <Leader>p :set paste<CR>i
nnoremap <Leader>np :set nopaste<CR>

" vim: set fdm=marker
