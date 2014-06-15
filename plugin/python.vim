Bundle 'https://github.com/scrooloose/syntastic.git'
let python_highlight_builtins = 1
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args="--ignore=E501,W601,E128"
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=0
