" Indentation
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

set foldmethod=marker
set foldmarker={,}
q!<cr>
inoremap {<cr> {<cr>}<c-o>O<tab>
inoremap [<cr> [<cr>]<c-o>O<tab>
inoremap (<cr> (<cr>)<c-o>O<tab>

