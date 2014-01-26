set t_Co=65536
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'https://github.com/maksimr/vim-jsbeautify.git'
Bundle 'https://github.com/msanders/snipmate.vim.git'
Bundle 'https://github.com/robhudson/snipmate_for_django.git'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'Tagbar'
"Bundle 'tpope/vim-rails.git'
Bundle 'https://github.com/scrooloose/nerdtree.git'
Bundle 'https://github.com/vim-scripts/The-NERD-Commenter.git'
Bundle 'https://github.com/jiangmiao/auto-pairs.git'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'Valloric/YouCompleteMe'
Bundle 'https://github.com/jmcantrell/vim-virtualenv.git'
"

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
imap <F3> <Esc>:mksession! ~/.vim/session<CR>
map <F3> <Esc>:mksession! ~/.vim/session<CR>
imap <F4> <Esc>:source ~/.vim/session<CR>
map <F4> <Esc>:source ~/.vim/session<CR>
nmap <C-n> :tabnew<CR>
"imap <F10> <Esc>:q<CR>
"map <F10> <Esc>:q<CR>
imap <C-o> <Esc>:NERDTreeFind<CR>
map <C-o> <Esc>:NERDTreeFind<CR>
map - <Esc>gT
imap - <Esc>gT
map fr gT
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
map ф a
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
map И B

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Bind for fast moving between splits.
map h <C-w>h
map l <C-w>l
map j <C-w>j
map k <C-w>k
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
"autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType python set ft=python.django " For SnipMate
"autocmd FileType html set ft=htmldjango.html " For SnipMate
"Bundle 'git://github.com/vim-scripts/AutoComplPop.git'
:imap <C-BS> <C-W>
:imap <A-BS> <C-W>
"au BufEnter *.py source ~/.vim/plugin/python.vim
"let g:ctags_path='/home/uantlord/.vim/ctags.vim'
"let g:ctags_statusline=1 
"set completeopt-=preview " это для документации
let NERDTreeShowHidden=1
let NERDChristmasTree=1
let NERDTreeDirArrows=0
let NERDTreeHighlightCursorline=0
let NERDTreeIgnore = ['\.pyc$']
"let g:pydiction_location='/usr/share/pydiction/complete-dict'
" ==============================================
" JEDI vim
" ==============================================
"Bundle 'https://github.com/davidhalter/jedi-vim.git'
"let g:jedi#auto_initialization = 1
"let g:jedi#auto_vim_configuration = 1
""let g:jedi#goto_command = "<leader>g"
""let g:jedi#related_names_command = "<leader>n"
""let g:jedi#get_definition_command = "<leader>d"
"let g:jedi#popup_on_dot = 1
"let g:jedi#popup_select_first = 1
"let g:jedi#show_function_definition = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_register_as_syntastic_checker = 0
" It seems that old versions of vim do not support more than 256 color values?
hi CursorLine cterm=NONE ctermbg=234
hi Pmenu ctermfg=white ctermbg=238
hi Search ctermfg=black
hi PmenuSel ctermfg=black
hi SpellBad ctermbg=088 ctermfg=white
hi Comment guifg=#777777 ctermfg=240
set cursorline
nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
let g:ycm_key_list_select_completion = ['Down']
let g:ycm_key_list_previous_completion = ['Up']
