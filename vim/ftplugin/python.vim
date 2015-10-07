" Run command
map <buffer> <f5> :!python %<CR>

let g:syntastic_python_checkers = ['pyflakes']

" Rope-mode
let g:pymode_rope = 0 " Disabled temporarily due to lag on rope gen.
let g:pymode_lint = 0
let g:pymode_pyflakes = 0
let g:pymode_doc = 0
let g:pymode_rope_completion = 0
let g:pymode_run = 0
let g:pymode_syntax = 0

" The command below made it so it enforced all of these Python conventions
" for textwidth etc, and that vertical line. The biggest problem with it
" is that it sets nowrap.
let g:pymode_options = 0

let g:jedi#documentation_command = ""

" Indentation
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
