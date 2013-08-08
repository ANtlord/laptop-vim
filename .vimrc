set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=/home/wantlord/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'https://github.com/maksimr/vim-jsbeautify.git'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/vim-scripts/The-NERD-Commenter.git'
Bundle 'https://github.com/jiangmiao/auto-pairs.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

let mapleader = "\\"
filetype plugin indent on     " required!
syntax on
set mouse=a        " Enable mouse usage (all modes)
set number
set autoindent
set nowrap
set ic
set hls
set directory=/tmp
set tabstop=4
set expandtab
set shiftwidth=4
set fencs=utf8,cp1251
set ffs=unix,dos
set nocursorline
colorscheme peachpuff
imap <F2> <Esc>:w<CR>
map <F2> <Esc>:w<CR>
imap <F3> <Esc>:mksession! /home/wantlord/.vim/session<CR>
map <F3> <Esc>:mksession! /home/wantlord/.vim/session<CR>
imap <F4> <Esc>:source /home/wantlord/.vim/session<CR>
map <F4> <Esc>:source /home/wantlord/.vim/session<CR>
nmap <C-n> :tabnew<CR>
"imap <F10> <Esc>:q<CR>
"map <F10> <Esc>:q<CR>
imap <C-o> <Esc>:NERDTreeFind<CR>
map <C-o> <Esc>:NERDTreeFind<CR>
map - <Esc>gT
imap - <Esc>gT
map = <Esc>gt
imap = <Esc>gt
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
\ "\<lt>C-n>" :
\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
map <C-c> "+y
map <C-x> "+d
imap <C-v> <Esc>"+pa
map <C-v> "+p
imap <C-F12> :q<CR>
map <C-F12> :q<CR>
imap <C-h> <Esc> :%s///gc
map <C-h> :%s///gc
imap <C-a> <Esc>:1<CR>vG<end>
map <C-a> :1<CR>vG<end>
map <tab> >gv
map <S-tab> <gv
map г u
map р h
map о j
map л k
map д l
map м v
map н y
map ш i
map щ o
map в d
map нн yy
map вв dd
map з p
map и b
map ц w
map т n
" Source a global configuration file if available
if filereadable("/etc/vimrc.local")
  source /etc/vimrc.local
endif 
vmap Q gq
nmap Q gqap
"map > >gv
"map < <gv
"autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set omnifunc=pysmell#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"Bundle 'git://github.com/vim-scripts/AutoComplPop.git'
:imap <C-BS> <C-W>
:imap <A-BS> <C-W>
"au BufEnter *.py source ~/.vim/plugin/python.vim
"let g:ctags_path='/home/wantlord/.vim/ctags.vim'
"let g:ctags_statusline=1 
"set completeopt-=preview " это для документации
let NERDTreeShowHidden=1

"let g:pydiction_location='/usr/share/pydiction/complete-dict'
" ==============================================
" JEDI vim
" ==============================================
Bundle 'https://github.com/davidhalter/jedi-vim.git'
Bundle 'https://github.com/kevinw/pyflakes-vim.git'
Bundle 'https://github.com/jmcantrell/vim-virtualenv.git'
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
"let g:jedi#goto_command = "<leader>g"
"let g:jedi#related_names_command = "<leader>n"
"let g:jedi#get_definition_command = "<leader>d"
let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 1
let g:jedi#show_function_definition = 1
let NERDTreeIgnore = ['\.pyc$']
