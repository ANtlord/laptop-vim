"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Indention                                 "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible               " be iMproved
set autoindent
set nowrap
set shiftwidth=4
set tabstop=4
set expandtab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=2
" syntax on
lang en_US.UTF-8
set ruler
set t_Co=256 
set termguicolors
set mouse=a        " Enable mouse usage (all modes)
set number
let mapleader = ","
set laststatus=2
set ignorecase
set cursorline
set fencs=utf8,cp1251
set ffs=unix,dos
set textwidth=100
set hidden

""" Swap files settings
set directory=/tmp
set nobackup
set noswapfile

"""search options""""
set hls
set incsearch
set nowrapscan
set smartcase

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" colorscheme peachpuff
" colorscheme breeze
colorscheme iceberg
set exrc
set secure
set splitright
set timeoutlen=320
set wildmenu
set nojoinspaces

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Optimization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set lazyredraw
syntax sync minlines=256
set synmaxcol=140

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldminlines=3
set foldnestmax=4
set nofoldenable
set foldmethod=indent

command Onspell set spelllang=en
au FileType d setlocal comments=sl:/**,mb:\ *,elx:*/
au FileType d setlocal formatoptions+=r
autocmd CmdwinEnter * nmap q :q<ESC>
autocmd CmdwinLeave * nmap  q q:

"""""""""""""""""""""""""""
" NETRW
"""""""""""""""""""""""""""
au FileType netrw nmap <buffer> <silent> <nowait> q :q!<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 0
let g:netrw_browse_split = 4
let g:netrw_altv = 0
let g:netrw_winsize = 20
let g:netrw_mousemaps = 0
" let g:netrw_usetab = 1
