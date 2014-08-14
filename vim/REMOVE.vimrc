"""
" .vimrc
" Author: Perry Bhandal
"""

set nocompatible " Ensure this always remains at the top as it has side effects.

"{{{General Hotkeys

" Jump between windows
nnoremap ` <c-w>w

nnoremap <f5> !ruby %<cr>

" Use tab to cycle through buffers and tabs 
nnoremap <tab> :bnext<cr>
nnoremap <s-tab> :tabnext<cr>

" Open git status
nnoremap <c-k> :Gstatus<cr>

" Auto indent pastes to surrounding code
nnoremap p pV`]=
" TODO: Quit 

" TODO: Save on ctrl + s
nnoremap <c-b> <c-]>

" TODO: Make this owrk for all languages, just doing ruby atm.
nnoremap <f5> :!ruby %<cr>

""" Begin Folding Hotkeys
" Use z for fold toggling
nnoremap z za
vnoremap z za

" Fold globally to a single level. TODO: Make this language sensitive.
nnoremap <c-z> :%foldc<cr>
nnoremap <a-z> :%foldo<cr>

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

"{{{
command InsertLineNumbers %s/^/\=(line('.')-line("'<")+0).'	'/
"}}}

"{{{ Basic Settings

syntax enable
set autoindent
set history=50
set showcmd

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
Plugin 'tpope/vim-sleuth'

Plugin 'airblade/vim-gitgutter'

"Tagbar
Plugin 'majutsushi/tagbar'
nnoremap <F8> :TagbarToggle<cr>
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
"END NERD TREE

" BEGIN SYNTASTIC
Plugin 'scrooloose/syntastic'
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

"{{{ File-Types
augroup ft_vim
	au!
	au FileType vim setlocal foldmethod=marker
	au FileType help setlocal textwidth=78
	au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

augroup ft_c
	au!
	au FileType c setlocal foldmethod=marker foldmarker={,}
augroup END

augroup ft_cpp
	au!
	au FileType cpp setlocal foldmethod=marker foldmarker={,}
augroup END

augroup ft_ruby
	au!
	au FileType ruby setlocal foldmethod=syntax tabstop=2 shiftwidth=2 softtabstop=2 
	au BufRead,BufNewFile Capfile setlocal filetype=ruby
augroup END	

augroup ft_dox 
	au!
	au FileType dox setlocal tabstop=8 shiftwidth=8 softtabstop=8
augroup END
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
