map <a-l> <C-w>l
map <a-h> <C-w>h
map <a-j> <C-w>j
map <a-k> <C-w>k
"colorscheme torte
colorscheme blackboard
"colorscheme solarized 
hi Pmenu guifg=#ffffff guibg=#444444
hi PmenuSel guifg=black
hi CursorLine guibg=#272727
hi Constant guifg=#00aa00
hi Type guifg=#7777ff
hi TabLine guifg=black
set guifont=Liberation\ Mono\ 9
set lines=40
set columns=160
"autocmd FileType python setlocal omnifunc=pysmell#Complete
"Bundle 'https://github.com/klen/python-mode.git'
"filetype off

"call pathogen#infect()
"call pathogen#helptags()
"pythonFuncParams
"hi pythonFuncName guifg=#77f
"pythonKeyword

"filetype plugin indent on
"Bundle 'https://github.com/vim-scripts/Pydiction.git'
"let g:pydiction_location = '/home/lantlord/.vim/bundle/Pydiction/complete-dict'
set guicursor=a:blinkon0
map <C-Tab> gt
imap <C-Tab> gt
map <C-S-Tab> gT
imap <C-S-Tab> gT
set expandtab
"set cindent

set guioptions-=e " включаем none-gui табы
set guioptions-=r " отключаем правый scrollbar
set guioptions-=R " отключаем правый scrollbar при вертикальном разделении окна
set guioptions-=b " отключаем нижний scrollbar 
set guioptions-=l " отключаем левый scrollbar
set guioptions-=L " отключаем левый scrollbar при вертикальном разделении окна
set guioptions-=T " отключаем панель инструментов
set guioptions-=m " отключаем меню
