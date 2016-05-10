" Indentation
set tabstop=4
set noexpandtab
set softtabstop=4
set shiftwidth=4

let g:EclimCompletionMethod = 'omnifunc'

nnoremap <s-E> :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0
let g:ycm_auto_trigger = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
	ProjectProblems
        let g:quickfix_is_open = 1
    endif
endfunction

" Import laodinmg
map <buffer> <C-S-o> :JavaImportOrganize<CR>

inoremap <silent> <c-s> <esc>:w<cr>
nnoremap <silent> <c-s> :w<cr>
