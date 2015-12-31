" Indentation
set tabstop=4
set noexpandtab
set softtabstop=4
set shiftwidth=4

let g:EclimCompletionMethod = 'omnifunc'

nnoremap <s-E> :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

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

function! Num2S(num, len)
    let filler = "                                                            "
    let text = '' . a:num
    return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

function! FoldText()
    let sub = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=', '', 'g')
    let diff = v:foldend - v:foldstart + 1
    return  '+' . v:folddashes . '[' . Num2S(diff,3) . ']' . sub
endfunction

set foldtext=FoldText()

