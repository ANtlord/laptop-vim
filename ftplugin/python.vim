let NERDTreeIgnore = ['\.pyc$']
"hi Folded guifg=#cccccc guibg=#111111 gui=bold 
"hi Folded guifg=#84b9ae guibg=#444444
"let fdm='fold-syntax'
"let g:pymode = 1
"let g:pymode_syntax = 0
"let g:pymode_rope_goto_def_newwin = 0
"let g:pymode_rope_always_show_complete_menu = 0
"let g:pymode_virtualenv = 1
"let g:pymode_lint_cwindow = 0
"let g:pymode_indent = 0
"if getline(1) =~ 'from django.db import models'
    "Snippet addmodel class <{}>(models.Model):<CR><><CR><CR>def __unicode__(self):<CR>return "%s" % (<{}>,)
    "Snippet mcf models.CharField(max_length=<{}>)<CR><{}>
    "Snippet mff models.FileField(upload_to=<{}>)<CR><{}>
    "Snippet mfpf models.FilePathField(path=<{}>, match="<{}>", recursive=<False>)<CR><{}>
    "Snippet mfloat models.FloatField(max_digits=<{}>, decimal_places=<{}>)<CR><{}>
    "Snippet mfk models.ForeignKey(<{}>)<CR><{}>
    "Snippet m2m models.ManyToManyField(<{}>)<CR><{}>
    "Snippet o2o models.OneToOneField(<{}>)<CR><{}>

"imap <silent> \cf = models.CharField(max_length=255, blank=True, null=True, verbose_name=u'')<ESC>I<space><left>
"map <silent> \cf o= models.CharField(max_length=255, blank=True, null=True, verbose_name=u'')<ESC>I<space><left>

"imap <silent> \fk = models.ForeignKey('to model', related_name='name for access', verbose_name=u'')<ESC>I<space><left>
"map <silent> \fk o= models.ForeignKey('to model', related_name='name for access', verbose_name=u'')<ESC>I<space><left>

"imap <silent> \if = models.IntegerField(default=0, verbose_name=u'')<ESC>I<space><left>
"map <silent> \if o= models.IntegerField(default=0, verbose_name=u'')<ESC>I<space><left>

"imap <silent> \pf = models.PositiveIntegerField(default=0, verbose_name=u'')<ESC>I<space><left>
"map <silent> \pf o= models.PositiveIntegerField(default=0, verbose_name=u'')<ESC>I<space><left>

"imap <silent> \bf = models.BooleanField(default=False, verbose_name=u'')<ESC>I<space><left>
"map <silent> \bf o= models.BooleanField(default=False, verbose_name=u'')<ESC>I<space><left>

"imap <silent> \im = models.ImageField(upload_to=generate_upload_name, verbose_name=u'Изображение', blank=True, null=True)<ESC>I<space><left>
"map <silent> \im o= models.ImageField(upload_to=generate_upload_name, verbose_name=u'Изображение', blank=True, null=True)<ESC>I<space><left>

"imap <silent> \ff = models.FileField(upload_to=generate_upload_name, verbose_name=u'Прикрепленный файл', blank=True, null=True)<ESC>I<space><left>
"map <silent> \ff o= models.FileField(upload_to=generate_upload_name, verbose_name=u'Прикрепленный файл', blank=True, null=True)<ESC>I<space><left>

map <leader>u :execute "grep! -rnHP '^(?!def\\<bar>class).*" . expand("<cword>") . "' ./ --include=\\*.py --exclude-dir=cache --exclude-dir=web --exclude-dir=.venv --exclude-dir=migrations" <bar> bel cwindow<CR>
map <leader>s :execute "grep! -rnHP '^(def\\<bar>class)<space>*" . expand("<cword>") . "' ./ --include=\\*.py --exclude-dir=cache --exclude-dir=web --exclude-dir=.venv --exclude-dir=migrations" <bar> bel cwindow<CR>
imap <silent> \setfunc <ESC>:call SetFunc()<CR>
map <silent> \setfunc :call SetFunc()<CR>

hi pythonParamName ctermfg=027
hi pythonClassName ctermfg=034


"Bundle 'https://github.com/scrooloose/syntastic.git'
let python_highlight_builtins = 1
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_python_flake8_args="--ignore=E501,W601,E128"
"let g:syntastic_check_on_open=1
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smartindent
set smarttab
"Plugin 'michaeljsmith/vim-indent-object'
"
" Python indent file
" Language:	    Python
" Maintainer:	    Eric Mc Sween <em@tomcom.de>
" Original Author:  David Bustos <bustos@caltech.edu> 
" Last Change:      2004 Jun 07

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

setlocal expandtab
setlocal nolisp
setlocal autoindent
setlocal indentexpr=GetPythonIndent(v:lnum)
setlocal indentkeys=!^F,o,O,<:>,0),0],0},=elif,=except

let s:maxoff = 50

" Find backwards the closest open parenthesis/bracket/brace.
function! s:SearchParensPair()
    let line = line('.')
    let col = col('.')
    
    " Skip strings and comments and don't look too far
    let skip = "line('.') < " . (line - s:maxoff) . " ? dummy :" .
                \ 'synIDattr(synID(line("."), col("."), 0), "name") =~? ' .
                \ '"string\\|comment"'

    " Search for parentheses
    call cursor(line, col)
    let parlnum = searchpair('(', '', ')', 'bW', skip)
    let parcol = col('.')

    " Search for brackets
    call cursor(line, col)
    let par2lnum = searchpair('\[', '', '\]', 'bW', skip)
    let par2col = col('.')

    " Search for braces
    call cursor(line, col)
    let par3lnum = searchpair('{', '', '}', 'bW', skip)
    let par3col = col('.')

    " Get the closest match
    if par2lnum > parlnum || (par2lnum == parlnum && par2col > parcol)
        let parlnum = par2lnum
        let parcol = par2col
    endif
    if par3lnum > parlnum || (par3lnum == parlnum && par3col > parcol)
        let parlnum = par3lnum
        let parcol = par3col
    endif 

    " Put the cursor on the match
    if parlnum > 0
        call cursor(parlnum, parcol)
    endif
    return parlnum
endfunction

" Find the start of a multi-line statement
function! s:StatementStart(lnum)
    let lnum = a:lnum
    while 1
        if getline(lnum - 1) =~ '\\$'
            let lnum = lnum - 1
        else
            call cursor(lnum, 1)
            let maybe_lnum = s:SearchParensPair()
            if maybe_lnum < 1
                return lnum
            else
                let lnum = maybe_lnum
            endif
        endif
    endwhile
endfunction

" Find the block starter that matches the current line
function! s:BlockStarter(lnum, block_start_re)
    let lnum = a:lnum
    let maxindent = 10000       " whatever
    while lnum > 1
        let lnum = prevnonblank(lnum - 1)
        if indent(lnum) < maxindent
            if getline(lnum) =~ a:block_start_re
                return lnum
            else 
                let maxindent = indent(lnum)
                " It's not worth going further if we reached the top level
                if maxindent == 0
                    return -1
                endif
            endif
        endif
    endwhile
    return -1
endfunction
                
function! GetPythonIndent(lnum)

    " First line has indent 0
    if a:lnum == 1
        return 0
    endif
    
    " If we can find an open parenthesis/bracket/brace, line up with it.
    call cursor(a:lnum, 1)
    let parlnum = s:SearchParensPair()
    if parlnum > 0
        let parcol = col('.')
        let closing_paren = match(getline(a:lnum), '^\s*[])}]') != -1
        if match(getline(parlnum), '[([{]\s*$', parcol - 1) != -1
            if closing_paren
                return indent(parlnum)
            else
                return indent(parlnum) + &shiftwidth
            endif
        else
            if closing_paren
                return parcol - 1
            else
                return parcol
            endif
        endif
    endif
    
    " Examine this line
    let thisline = getline(a:lnum)
    let thisindent = indent(a:lnum)

    " If the line starts with 'elif' or 'else', line up with 'if' or 'elif'
    if thisline =~ '^\s*\(elif\|else\)\>'
        let bslnum = s:BlockStarter(a:lnum, '^\s*\(if\|elif\)\>')
        if bslnum > 0
            return indent(bslnum)
        else
            return -1
        endif
    endif
        
    " If the line starts with 'except' or 'finally', line up with 'try'
    " or 'except'
    if thisline =~ '^\s*\(except\|finally\)\>'
        let bslnum = s:BlockStarter(a:lnum, '^\s*\(try\|except\)\>')
        if bslnum > 0
            return indent(bslnum)
        else
            return -1
        endif
    endif
    
    " Examine previous line
    let plnum = a:lnum - 1
    let pline = getline(plnum)
    let sslnum = s:StatementStart(plnum)
    
    " If the previous line is blank, keep the same indentation
    if pline =~ '^\s*$'
        return -1
    endif
    
    " If this line is explicitly joined, try to find an indentation that looks
    " good. 
    if pline =~ '\\$'
        let compound_statement = '^\s*\(if\|while\|for\s.*\sin\|except\)\s*'
        let maybe_indent = matchend(getline(sslnum), compound_statement)
        if maybe_indent != -1
            return maybe_indent
        else
            return indent(sslnum) + &sw * 2
        endif
    endif
    
    " If the previous line ended with a colon, indent relative to
    " statement start.
    if pline =~ ':\s*$'
        return indent(sslnum) + &sw
    endif

    " If the previous line was a stop-execution statement or a pass
    if getline(sslnum) =~ '^\s*\(break\|continue\|raise\|return\|pass\)\>'
        " See if the user has already dedented
        if indent(a:lnum) > indent(sslnum) - &sw
            " If not, recommend one dedent
            return indent(sslnum) - &sw
        endif
        " Otherwise, trust the user
        return -1
    endif

    " In all other cases, line up with the start of the previous statement.
    return indent(sslnum)
endfunction


let g:syntastic_python_flake8_args='--ignore=E501,E265'
let g:python_highlight_all = 1
"map <leader>d :RopeGotoDefinition<CR>
let g:ropevim_goto_def_newwin = "vnew"
let g:syntastic_loc_list_height = 5
