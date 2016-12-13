if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" Put tslint into the list below if you want to run it. Disabled for now as it
" lags on save. Add it back once you update to Vim 8.
let g:syntastic_typescript_checkers = []

let g:tsuquyomi_disable_quickfix = 1
