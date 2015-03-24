"""
" .vimrc
" Author: Perry Bhandal
"""

set nocompatible " Ensure this always remains at the top as it has side effects.

"{{{General Hotkeys

" Jump between windows
nnoremap ` <c-w>w

nnoremap <a-n> :tabnew<cr>
nnoremap <c-n> :vnew<cr>

" Big jump
nnoremap <s-j> 20j
nnoremap <s-k> 20k
nnoremap <s-b> 10b
nnoremap <s-w> 10w

vnoremap <s-j> 20j
vnoremap <s-k> 20k
nnoremap <s-b> 10b
nnoremap <s-w> 10w

nnoremap <c-w> :q<cr>

inoremap <silent> <c-s> <esc>:w<cr>
nnoremap <silent> <c-s> :w<cr>

" Use tab to cycle through buffers and tabs 
nnoremap <tab> :Bufferlist<cr>
nnoremap <s-tab> :tabnext<cr>

nnoremap <F3> :setlocal spell! spelllang=en_us<CR>

" Open git status
nnoremap <c-k> :ToggleGStatus<cr>
nnoremap <a-k> :Gcommit -m "

nnoremap <c-a> <esc>ggvG<s-$>

" Auto indent pastes to surrounding code
vnoremap p "_dP
" TODO: Quit 

" TODO: Save on ctrl + s
nnoremap <c-b> <c-]>

" Folding hotkeys
nnoremap <c-z> zM
nnoremap <a-z> zR
nnoremap z za

"TODO: Add command to fold everything to a method-level.

""" Begin Git hotkeys
nnoremap <s-k> :Gdiff<cr>
"TODO: Add for Gstatus and Gcommit here (and add, potentially)

"Reload .vimrc file manually
nnoremap <f12> :source ~/.vimrc<cr>

" Syntastic hotkeys
nnoremap <silent> <c-e> :Error<cr>
nnoremap <silent> <a-e> :lclose<cr> " TODO: Fix this so we can eventually just use a single key (c-e) to toggle open and close).
"}}}

"{{{Custom Functions
command InsertLineNumbers %s/^/\=(line('.')-line("'<")+0).'	'/
"}}}

"{{{ Basic Settings

" Line highlighting
set cursorline

syntax enable
set autoindent
set history=50
set showcmd

" Highlight our current line
set cursorline

" This helps with preventing value errors from YCM when opening cpp files.
" Squelches press enter.
set cmdheight=2

filetype on
filetype plugin indent on
filetype plugin on

" Return to same line when you re-open a file
augroup line_return
	au!
	au BufReadPost *
				\ if line("'\"") > 0 && line("'\"") <= line("$") |
				\     execute 'normal! g`"zvzz' |
				\ endif
augroup END

" When we open a new split with vsplit or vnew it'll open to the right
" (defaults to left)
set splitright

" Don't store backups (just :w constantly!)
set nobackup
set noswapfile

set number " Show them relatively.

" Resize splits when our window is resized.
au VimResized * :wincmd =

" Auto reload .vimrc on change.
autocmd BufWritePost .vimrc source %


"}}}

"{{{ Spelling
set dictionary=/usr/share/dict/words	
"}}}

"{{{ Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""Begin Plugins

" Appearance
Plugin 'tomasr/molokai'

" Source Control
Plugin 'tpope/vim-fugitive'

Plugin 'xuhdev/vim-latex-live-preview'

" UI Elements
Plugin 'bling/vim-airline'

Plugin 'klen/python-mode'

Plugin 'Glench/Vim-Jinja2-Syntax'

" BEGIN
Bundle 'joonty/vdebug'
nnoremap <f1> :VdebugStart<CR>
nnoremap <S-f5> :call DebugCommanderStart()<CR>
" END

" Other
"BEGIN YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" Auto close window once we're done selecting an autocompletion option
let g:ycm_autoclose_preview_window_after_insertion = 1 
" END YouCompleteMe

Plugin 'buffet.vim'

"Ctrlp
Plugin 'kien/ctrlp.vim'
set wildignore+=*.pyc,*/venv/*
let g:ctrlp_prompt_mappings = {'PrtClearCache()': ['<c-s-r>']}
"END ctrlp

Plugin 'tpope/vim-sensible'

Plugin 'airblade/vim-gitgutter'

"Tagbar
Plugin 'majutsushi/tagbar'
nnoremap <s-t> :TagbarToggle<cr>
let g:tagbar_autoclose = 1
"END tagbar

"" Language specific
Plugin 'c.vim'

" Ruby
Plugin 'endwise.vim'

Plugin 'tpope/vim-rails'

" BEGIN Vim-ruby Bundle
Bundle 'vim-ruby/vim-ruby'

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
" END vim-ruby bundle

" BEGIN NERDTREE
Plugin 'scrooloose/nerdtree'
map <a-p> :NERDTreeToggle<CR>
" Auto close side file window when we select a file.
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
"END NERD TREE


" BEGIN SYNTASTIC
Plugin 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
" let g:syntastic_auto_loc_list = 1 <-- This line used to load the loc list on
" save.
" END SYNTASTIC

"""End Plugins
call vundle#end()

" Squelches ycm usage warnings when using global extra_conf
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/.ycm_extra_conf.py']

"}}}

"{{{ Folding

set foldlevelstart=20

"}}}

"{{{ Appearance

colorscheme molokai

" Remove toolbars in case we're running gvim
set guioptions=aci


"}}}

"{{{Clipboard
set clipboard=unnamed
set clipboard=unnamedplus
"}}}

"{{{ Misc fixes
" BEGIN alt fix for terminal vim

let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50
" END alt fix for terminal vim
"}}}

"{{{Functions
function! ToggleGStatus()
	if buflisted(bufname('.git/index'))
		bd .git/index
	else
		Gstatus
	endif
endfunction
command ToggleGStatus :call ToggleGStatus()

"Prevent pasting from overwriting register
function! YRRunAfterMaps()                                                                                                      
	" From Steve Losh, Preserve the yank post selection/put.    
	vnoremap p :<c-u>YRPaste 'p', 'v'<cr>gv:YRYankRange 'v'<cr> 
endfunction  


function! IncrementByOne()
	s/\d\+/\=(submatch(0)+1)/g
endfunction


function! DecrementByOne()
	s/\d\+/\=(submatch(0)-1)/g
endfunction

"}}}

"{{{Filetype Detection
au BufNewFile,BufRead *.ctml set filetype=xml
au BufNewFile,BufRead *.ssl set filetype=458
au BufNewFile,BufRead *.pt set filetype=458

" TODO: Fix this, it's pretty hacky. Was having trouble with ERB indentation
" on snippets. This isn't an ideal approach.
au BufNewFile,BufRead *.erb set filetype=xml
au BufNewFile,BufRead *.txt set filetype=txt
"}}}
