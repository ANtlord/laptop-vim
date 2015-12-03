" Vim syntax file
" Language:     Python
" Maintainer:   Dmitry Vasiliev <dima at hlabs dot org>
" URL:          https://github.com/hdima/python-syntax
" Last Change:  2013-06-02
" Filenames:    *.py
" Version:      3.3.3
"
" Based on python.vim (from Vim 6.1 distribution)
" by Neil Schemenauer <nas at python dot ca>
"
" Please use the following channels for reporting bugs, offering suggestions or
" feedback:

" - python.vim issue tracker: https://github.com/hdima/python-syntax/issues
" - Email: Dmitry Vasiliev (dima at hlabs.org)
" - Send a message or follow me for updates on Twitter: `@hdima
"   <https://twitter.com/hdima>`__
"
" Contributors
" ============
"
" List of the contributors in alphabetical order:
"
"   Andrea Riciputi
"   Anton Butanaev
"   Caleb Adamantine
"   Jeroen Ruigrok van der Werven
"   John Eikenberry
"   Marc Weber
"   Pedro Algarvio
"   Will Gray
"
" Options
" =======
"
"    :let OPTION_NAME = 1                   Enable option
"    :let OPTION_NAME = 0                   Disable option
"
"
" Option to select Python version
" -------------------------------
"
"    python_version_2                       Enable highlighting for Python 2
"                                           (Python 3 highlighting is enabled
"                                           by default). Can also be set as
"                                           a buffer (b:python_version_2)
"                                           variable.
"
"    You can also use the following local to buffer commands to switch
"    between two highlighting modes:
"
"    :Python2Syntax                         Switch to Python 2 highlighting
"                                           mode
"    :Python3Syntax                         Switch to Python 3 highlighting
"                                           mode
"
" Option names used by the script
" -------------------------------
"
"    python_highlight_builtins              Highlight builtin functions and
"                                           objects
"      python_highlight_builtin_objs        Highlight builtin objects only
"      python_highlight_builtin_funcs       Highlight builtin functions only
"    python_highlight_exceptions            Highlight standard exceptions
"    python_highlight_string_formatting     Highlight % string formatting
"    python_highlight_string_format         Highlight str.format syntax
"    python_highlight_string_templates      Highlight string.Template syntax
"    python_highlight_indent_errors         Highlight indentation errors
"    python_highlight_space_errors          Highlight trailing spaces
"    python_highlight_doctests              Highlight doc-tests
"    python_print_as_function               Highlight 'print' statement as
"                                           function for Python 2
"
"    python_highlight_all                   Enable all the options above
"                                           NOTE: This option don't override
"                                           any previously set options
"
"    python_slow_sync                       Can be set to 0 for slow machines
"

" For version 5.x: Clear all syntax items
" For versions greater than 6.x: Quit when a syntax file was already loaded

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

"
" Commands
"
command! -buffer Python2Syntax let b:python_version_2 = 1 | let &syntax=&syntax
command! -buffer Python3Syntax let b:python_version_2 = 0 | let &syntax=&syntax

" Enable option if it's not defined
function! s:EnableByDefault(name)
  if !exists(a:name)
    let {a:name} = 1
  endif
endfunction

" Check if option is enabled
function! s:Enabled(name)
  return exists(a:name) && {a:name}
endfunction

" Is it Python 2 syntax?
function! s:Python2Syntax()
  if exists("b:python_version_2")
      return b:python_version_2
  endif
  return s:Enabled("g:python_version_2")
endfunction

"
" Default options
"

call s:EnableByDefault("g:python_slow_sync")

if s:Enabled("g:python_highlight_all")
  call s:EnableByDefault("g:python_highlight_builtins")
  if s:Enabled("g:python_highlight_builtins")
    call s:EnableByDefault("g:python_highlight_builtin_objs")
    call s:EnableByDefault("g:python_highlight_builtin_funcs")
  endif
  call s:EnableByDefault("g:python_highlight_exceptions")
  call s:EnableByDefault("g:python_highlight_string_formatting")
  call s:EnableByDefault("g:python_highlight_string_format")
  call s:EnableByDefault("g:python_highlight_string_templates")
  call s:EnableByDefault("g:python_highlight_indent_errors")
  call s:EnableByDefault("g:python_highlight_space_errors")
  call s:EnableByDefault("g:python_highlight_doctests")
  call s:EnableByDefault("g:python_print_as_function")
endif

"
" Keywords
"

syn keyword pythonStatement     break continue del
syn keyword pythonStatement     exec return
syn keyword pythonStatement     pass raise
syn keyword pythonStatement     global assert
syn keyword pythonStatement     lambda yield
syn keyword pythonStatement     with
syn keyword pythonStatement     def class nextgroup=pythonFunction skipwhite
syn keyword pythonRepeat        for while
syn keyword pythonConditional   if elif else
syn keyword pythonPreCondit     import from
syn keyword pythonException     try except finally
syn keyword pythonOperator      and in is not or

if s:Python2Syntax()
  if !s:Enabled("g:python_print_as_function")
    syn keyword pythonStatement  print
  endif
  syn keyword pythonPreCondit   as
  syn match   pythonFunction    "[a-zA-Z_][a-zA-Z0-9_]*" display contained
else
  syn keyword pythonStatement   as nonlocal False None True
  syn match   pythonFunction    "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
endif

"
" Decorators (new in Python 2.4)
"

syn match   pythonDecorator	"@" display nextgroup=pythonDottedName skipwhite
syn match   pythonDottedName "[a-zA-Z_][a-zA-Z0-9_]*\%(\.[a-zA-Z_][a-zA-Z0-9_]*\)*" display contained
syn match   pythonDot        "\." display containedin=pythonDottedName

"
" Comments
"

syn match   pythonComment	"#.*$" display contains=pythonTodo,@Spell
syn match   pythonRun		"\%^#!.*$"
syn match   pythonCoding	"\%^.*\%(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$"
syn keyword pythonTodo		TODO FIXME XXX contained

"
" Errors
"

syn match pythonError		"\<\d\+\D\+\>" display
syn match pythonError		"[$?]" display
syn match pythonError		"[&|]\{2,}" display
syn match pythonError		"[=]\{3,}" display

" Mixing spaces and tabs also may be used for pretty formatting multiline
" statements
if s:Enabled("g:python_highlight_indent_errors")
  syn match pythonIndentError	"^\s*\%( \t\|\t \)\s*\S"me=e-1 display
endif

" Trailing space errors
if s:Enabled("g:python_highlight_space_errors")
  syn match pythonSpaceError	"\s\+$" display
endif

"syn match pythonClassName	"\s\+$"
"syn region pythonClassName   start="\<class\>" end="(" end=":"
"
" Strings
"

if s:Python2Syntax()
  " Python 2 strings
  syn region pythonString   start=+[bB]\='+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+[bB]\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+[bB]\="""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonString   start=+[bB]\='''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
else
  " Python 3 byte strings
  syn region pythonBytes		start=+[bB]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
  syn region pythonBytes		start=+[bB]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesError,pythonBytesContent,@Spell
  syn region pythonBytes		start=+[bB]"""+ end=+"""+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonBytes		start=+[bB]'''+ end=+'''+ keepend contains=pythonBytesError,pythonBytesContent,pythonDocTest,pythonSpaceError,@Spell

  syn match pythonBytesError    ".\+" display contained
  syn match pythonBytesContent  "[\u0000-\u00ff]\+" display contained contains=pythonBytesEscape,pythonBytesEscapeError
endif

syn match pythonBytesEscape       +\\[abfnrtv'"\\]+ display contained
syn match pythonBytesEscape       "\\\o\o\=\o\=" display contained
syn match pythonBytesEscapeError  "\\\o\{,2}[89]" display contained
syn match pythonBytesEscape       "\\x\x\{2}" display contained
syn match pythonBytesEscapeError  "\\x\x\=\X" display contained
syn match pythonBytesEscape       "\\$"

syn match pythonUniEscape         "\\u\x\{4}" display contained
syn match pythonUniEscapeError    "\\u\x\{,3}\X" display contained
syn match pythonUniEscape         "\\U\x\{8}" display contained
syn match pythonUniEscapeError    "\\U\x\{,7}\X" display contained
syn match pythonUniEscape         "\\N{[A-Z ]\+}" display contained
syn match pythonUniEscapeError    "\\N{[^A-Z ]\+}" display contained

if s:Python2Syntax()
  " Python 2 Unicode strings
  syn region pythonUniString  start=+[uU]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonUniString  start=+[uU]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonUniString  start=+[uU]"""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonUniString  start=+[uU]'''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
else
  " Python 3 strings
  syn region pythonString   start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,@Spell
  syn region pythonString   start=+"""+ end=+"""+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonString   start=+'''+ end=+'''+ keepend contains=pythonBytesEscape,pythonBytesEscapeError,pythonUniEscape,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell
endif

if s:Python2Syntax()
  " Python 2 Unicode raw strings
  syn region pythonUniRawString start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
  syn region pythonUniRawString start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
  syn region pythonUniRawString start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonUniRawString start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest,pythonSpaceError,@Spell

  syn match  pythonUniRawEscape       "\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}" display contained
  syn match  pythonUniRawEscapeError  "\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X" display contained
endif

" Python 2/3 raw strings
if s:Python2Syntax()
  syn region pythonRawString  start=+[bB]\=[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawString  start=+[bB]\=[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
else
  syn region pythonRawString  start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawString  start=+[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawString  start=+[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

  syn region pythonRawBytes  start=+[bB][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawBytes  start=+[bB][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
  syn region pythonRawBytes  start=+[bB][rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
  syn region pythonRawBytes  start=+[bB][rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell
endif

syn match pythonRawEscape +\\['"]+ display transparent contained

if s:Enabled("g:python_highlight_string_formatting")
  " % operator string formatting
  if s:Python2Syntax()
    syn match pythonStrFormatting	"%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrFormatting	"%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrFormatting	"%\%(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
    syn match pythonStrFormatting	"%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled("g:python_highlight_string_format")
  " str.format syntax
  if s:Python2Syntax()
    syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrFormat	"{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrFormat "{{\|}}" contained containedin=pythonString,pythonRawString
    syn match pythonStrFormat	"{\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)\=\%(\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\[\%(\d\+\|[^!:\}]\+\)\]\)*\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}" contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled("g:python_highlight_string_templates")
  " string.Template format
  if s:Python2Syntax()
    syn match pythonStrTemplate	"\$\$" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrTemplate	"\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
    syn match pythonStrTemplate	"\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonUniString,pythonUniRawString,pythonRawString
  else
    syn match pythonStrTemplate	"\$\$" contained containedin=pythonString,pythonRawString
    syn match pythonStrTemplate	"\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonRawString
    syn match pythonStrTemplate	"\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonRawString
  endif
endif

if s:Enabled("g:python_highlight_doctests")
  " DocTests
  syn region pythonDocTest	start="^\s*>>>" end=+'''+he=s-1 end="^\s*$" contained
  syn region pythonDocTest2	start="^\s*>>>" end=+"""+he=s-1 end="^\s*$" contained
endif

"
" Numbers (ints, longs, floats, complex)
"

if s:Python2Syntax()
  syn match   pythonHexError	"\<0[xX]\x*[g-zG-Z]\+\x*[lL]\=\>" display
  syn match   pythonOctError	"\<0[oO]\=\o*\D\+\d*[lL]\=\>" display
  syn match   pythonBinError	"\<0[bB][01]*\D\+\d*[lL]\=\>" display

  syn match   pythonHexNumber	"\<0[xX]\x\+[lL]\=\>" display
  syn match   pythonOctNumber "\<0[oO]\o\+[lL]\=\>" display
  syn match   pythonBinNumber "\<0[bB][01]\+[lL]\=\>" display

  syn match   pythonNumberError	"\<\d\+\D[lL]\=\>" display
  syn match   pythonNumber	"\<\d[lL]\=\>" display
  syn match   pythonNumber	"\<[0-9]\d\+[lL]\=\>" display
  syn match   pythonNumber	"\<\d\+[lLjJ]\>" display

  syn match   pythonOctError	"\<0[oO]\=\o*[8-9]\d*[lL]\=\>" display
  syn match   pythonBinError	"\<0[bB][01]*[2-9]\d*[lL]\=\>" display
else
  syn match   pythonHexError	"\<0[xX]\x*[g-zG-Z]\x*\>" display
  syn match   pythonOctError	"\<0[oO]\=\o*\D\+\d*\>" display
  syn match   pythonBinError	"\<0[bB][01]*\D\+\d*\>" display

  syn match   pythonHexNumber	"\<0[xX]\x\+\>" display
  syn match   pythonOctNumber "\<0[oO]\o\+\>" display
  syn match   pythonBinNumber "\<0[bB][01]\+\>" display

  syn match   pythonNumberError	"\<\d\+\D\>" display
  syn match   pythonNumberError	"\<0\d\+\>" display
  syn match   pythonNumber	"\<\d\>" display
  syn match   pythonNumber	"\<[1-9]\d\+\>" display
  syn match   pythonNumber	"\<\d\+[jJ]\>" display

  syn match   pythonOctError	"\<0[oO]\=\o*[8-9]\d*\>" display
  syn match   pythonBinError	"\<0[bB][01]*[2-9]\d*\>" display
endif

syn match   pythonFloat		"\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match   pythonFloat		"\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match   pythonFloat		"\<\d\+\.\d*\%([eE][+-]\=\d\+\)\=[jJ]\=" display

"
" Builtin objects and types
"

if s:Enabled("g:python_highlight_builtin_objs")
  if s:Python2Syntax()
    syn keyword pythonBuiltinObj	True False None
  endif
  syn keyword pythonBuiltinObj	Ellipsis NotImplemented
  syn keyword pythonBuiltinObj	__debug__ __doc__ __file__ __name__ __package__
endif

"
" Builtin functions
"

if s:Enabled("g:python_highlight_builtin_funcs")
  if s:Python2Syntax()
    syn keyword pythonBuiltinFunc	apply basestring buffer callable coerce
    syn keyword pythonBuiltinFunc	execfile file help intern long raw_input
    syn keyword pythonBuiltinFunc	reduce reload unichr unicode xrange
    if s:Enabled("g:python_print_as_function")
      syn keyword pythonBuiltinFunc	print
    endif
  else
    syn keyword pythonBuiltinFunc	ascii exec memoryview print
  endif
  syn keyword pythonBuiltinFunc	__import__ abs all any
  syn keyword pythonBuiltinFunc	bin bool bytearray bytes
  syn keyword pythonBuiltinFunc	chr classmethod cmp compile complex
  syn keyword pythonBuiltinFunc	delattr dict dir divmod enumerate eval
  syn keyword pythonBuiltinFunc	filter float format frozenset getattr
  syn keyword pythonBuiltinFunc	globals hasattr hash hex id
  syn keyword pythonBuiltinFunc	input int isinstance
  syn keyword pythonBuiltinFunc	issubclass iter len list locals map max
  syn keyword pythonBuiltinFunc	min next object oct open ord
  syn keyword pythonBuiltinFunc	pow property range
  syn keyword pythonBuiltinFunc	repr reversed round set setattr
  syn keyword pythonBuiltinFunc	slice sorted staticmethod str sum super tuple
  syn keyword pythonBuiltinFunc	type vars zip
endif

"
" Builtin exceptions and warnings
"

if s:Enabled("g:python_highlight_exceptions")
  if s:Python2Syntax()
    syn keyword pythonExClass	StandardError
  else
    syn keyword pythonExClass	BlockingIOError ChildProcessError
    syn keyword pythonExClass	ConnectionError BrokenPipeError
    syn keyword pythonExClass	ConnectionAbortedError ConnectionRefusedError
    syn keyword pythonExClass	ConnectionResetError FileExistsError
    syn keyword pythonExClass	FileNotFoundError InterruptedError
    syn keyword pythonExClass	IsADirectoryError NotADirectoryError
    syn keyword pythonExClass	PermissionError ProcessLookupError TimeoutError

    syn keyword pythonExClass	ResourceWarning
  endif
  syn keyword pythonExClass	BaseException
  syn keyword pythonExClass	Exception ArithmeticError
  syn keyword pythonExClass	LookupError EnvironmentError

  syn keyword pythonExClass	AssertionError AttributeError BufferError EOFError
  syn keyword pythonExClass	FloatingPointError GeneratorExit IOError
  syn keyword pythonExClass	ImportError IndexError KeyError
  syn keyword pythonExClass	KeyboardInterrupt MemoryError NameError
  syn keyword pythonExClass	NotImplementedError OSError OverflowError
  syn keyword pythonExClass	ReferenceError RuntimeError StopIteration
  syn keyword pythonExClass	SyntaxError IndentationError TabError
  syn keyword pythonExClass	SystemError SystemExit TypeError
  syn keyword pythonExClass	UnboundLocalError UnicodeError
  syn keyword pythonExClass	UnicodeEncodeError UnicodeDecodeError
  syn keyword pythonExClass	UnicodeTranslateError ValueError VMSError
  syn keyword pythonExClass	WindowsError ZeroDivisionError

  syn keyword pythonExClass	Warning UserWarning BytesWarning DeprecationWarning
  syn keyword pythonExClass	PendingDepricationWarning SyntaxWarning
  syn keyword pythonExClass	RuntimeWarning FutureWarning
  syn keyword pythonExClass	ImportWarning UnicodeWarning
endif

if s:Enabled("g:python_slow_sync")
  syn sync minlines=2000
else
  " This is fast but code inside triple quoted strings screws it up. It
  " is impossible to fix because the only way to know if you are inside a
  " triple quoted string is to start from the beginning of the file.
  syn sync match pythonSync grouphere NONE "):$"
  syn sync maxlines=200
endif

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pythonStatement        Statement
  HiLink pythonPreCondit        Statement
  HiLink pythonFunction         Function
  HiLink pythonConditional      Conditional
  HiLink pythonRepeat           Repeat
  HiLink pythonException        Exception
  HiLink pythonOperator         Operator

  HiLink pythonDecorator        Define
  HiLink pythonDottedName       Function
  HiLink pythonDot              Normal

  HiLink pythonComment          Comment
  HiLink pythonCoding           Special
  HiLink pythonRun              Special
  HiLink pythonTodo             Todo

  HiLink pythonError            Error
  HiLink pythonIndentError      Error
  HiLink pythonSpaceError       Error

  HiLink pythonString           String
  HiLink pythonRawString        String

  HiLink pythonUniEscape        Special
  HiLink pythonUniEscapeError   Error

  if s:Python2Syntax()
    HiLink pythonUniString          String
    HiLink pythonUniRawString       String
    HiLink pythonUniRawEscape       Special
    HiLink pythonUniRawEscapeError  Error
  else
    HiLink pythonBytes              String
    HiLink pythonRawBytes           String
    HiLink pythonBytesContent       String
    HiLink pythonBytesError         Error
    HiLink pythonBytesEscape        Special
    HiLink pythonBytesEscapeError   Error
  endif

  HiLink pythonStrFormatting    Special
  HiLink pythonStrFormat        Special
  HiLink pythonStrTemplate      Special

  HiLink pythonDocTest          Special
  HiLink pythonDocTest2         Special

  HiLink pythonNumber           Number
  HiLink pythonHexNumber        Number
  HiLink pythonOctNumber        Number
  HiLink pythonBinNumber        Number
  HiLink pythonFloat            Float
  HiLink pythonNumberError      Error
  HiLink pythonOctError         Error
  HiLink pythonHexError         Error
  HiLink pythonBinError         Error

  HiLink pythonBuiltinObj       Structure
  HiLink pythonBuiltinFunc      Function

  HiLink pythonExClass          Structure

  delcommand HiLink
endif

let b:current_syntax = "python"

hi Folded guifg=#cccccc guibg=#222222 
hi Constant guifg=#44ff44
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
"imap <C-c> <Esc>"+ya
"map <C-c> "+y
"imap <C-x> <Esc>"+da
"map <C-x> "+d
"imap <C-v> <Esc>"+pa
"map <C-v> "+p
"if getline(1) =~ 'from django.db import models'
    "Snippet addmodel class <{}>(models.Model):<CR><><CR><CR>def __unicode__(self):<CR>return "%s" % (<{}>,)
    "Snippet mcf models.CharField(max_length=<{}>)<CR><{}>
    "Snippet mff models.FileField(upload_to=<{}>)<CR><{}>
    "Snippet mfpf models.FilePathField(path=<{}>, match="<{}>", recursive=<False>)<CR><{}>
    "Snippet mfloat models.FloatField(max_digits=<{}>, decimal_places=<{}>)<CR><{}>
    "Snippet mfk models.ForeignKey(<{}>)<CR><{}>
    "Snippet m2m models.ManyToManyField(<{}>)<CR><{}>
    "Snippet o2o models.OneToOneField(<{}>)<CR><{}>

imap <silent> \cf = models.CharField(max_length=255, blank=True, null=True, verbose_name=u'')<ESC>I<space><left>
map <silent> \cf o= models.CharField(max_length=255, blank=True, null=True, verbose_name=u'')<ESC>I<space><left>

imap <silent> \fk = models.ForeignKey('to model', related_name='name for access', verbose_name=u'')<ESC>I<space><left>
map <silent> \fk o= models.ForeignKey('to model', related_name='name for access', verbose_name=u'')<ESC>I<space><left>

imap <silent> \if = models.IntegerField(default=0, verbose_name=u'')<ESC>I<space><left>
map <silent> \if o= models.IntegerField(default=0, verbose_name=u'')<ESC>I<space><left>

imap <silent> \pf = models.PositiveIntegerField(default=0, verbose_name=u'')<ESC>I<space><left>
map <silent> \pf o= models.PositiveIntegerField(default=0, verbose_name=u'')<ESC>I<space><left>

imap <silent> \bf = models.BooleanField(default=False, verbose_name=u'')<ESC>I<space><left>
map <silent> \bf o= models.BooleanField(default=False, verbose_name=u'')<ESC>I<space><left>

imap <silent> \im = models.ImageField(upload_to=generate_upload_name, verbose_name=u'Изображение', blank=True, null=True)<ESC>I<space><left>
map <silent> \im o= models.ImageField(upload_to=generate_upload_name, verbose_name=u'Изображение', blank=True, null=True)<ESC>I<space><left>

imap <silent> \ff = models.FileField(upload_to=generate_upload_name, verbose_name=u'Прикрепленный файл', blank=True, null=True)<ESC>I<space><left>
map <silent> \ff o= models.FileField(upload_to=generate_upload_name, verbose_name=u'Прикрепленный файл', blank=True, null=True)<ESC>I<space><left>

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


let g:syntastic_python_flake8_args='--ignore=E501'
