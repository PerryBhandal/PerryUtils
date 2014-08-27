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
vnoremap <s-j> 20j
vnoremap <s-k> 20k

nnoremap <a-w> :q<cr>

inoremap <c-s> <esc>:w<cr>
nnoremap <c-s> :w<cr>

" Use tab to cycle through buffers and tabs 
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
nnoremap gd :Gdiff<cr>
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

syntax enable
set autoindent
set history=50
set showcmd

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

" UI Elements
Plugin 'bling/vim-airline'

" WinTabs
Plugin 'zefei/vim-wintabs'
nnoremap <a-w> :WintabsOnly<cr>
nnoremap <c-w> :WintabsCloseWindow<cr>
nnoremap <tab> :WintabsNext<cr>
" End WinTabs

" Other
"BEGIN YouCompleteMe
Plugin 'Valloric/YouCompleteMe'
" Auto close window once we're done selecting an autocompletion option
let g:ycm_autoclose_preview_window_after_insertion = 1 
" END YouCompleteMe

"Ctrlp
Plugin 'kien/ctrlp.vim'
"END ctrlp

Plugin 'tpope/vim-sensible'

Plugin 'airblade/vim-gitgutter'

"Tagbar
Plugin 'majutsushi/tagbar'
nnoremap <s-p> :TagbarToggle<cr>
let g:tagbar_autoclose = 1
"END tagbar

"" Language specific
Plugin 'c.vim'

" Ruby
Plugin 'endwise.vim'

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

let g:syntastic_ruby_checkers = ['rubylint']
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
"}}}

"{{{Filetype Detection
au BufNewFile,BufRead *.ctml set filetype=xml
"}}}
