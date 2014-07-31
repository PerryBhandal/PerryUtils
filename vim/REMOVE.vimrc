"""
" .vimrc
" Author: Perry Bhandal
"""

"{{{ Basic Settings

set nocompatible
set autoindent
set history=50
set showcmd

filetype plugin indent on

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

set number  " Show line numbers

" Resize splits when our window is resized.
au VimResized * :wincmd =
"}}}

"{{{General Hotkeys
	nnoremap <c-w> :q<cr>
"}}}

"{{{ Spelling
	set dictionary=/usr/share/dict/words	
"}}}

"{{{ Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""Begin Plugins

" Appearance
Plugin 'jgdavey/vim-railscasts'

" Source Control
Plugin 'tpope/vim-fugitive'

" UI Elements
Plugin 'bling/vim-airline'

"""End Plugins

call vundle#end()

	"{{{GitFugitive
	nnoremap gd :Gdiff<cr>
	"TODO: Add for Gstatus and Gcommit here (and add, potentially)
	"}}}

"}}}

"{{{ Folding

set foldlevelstart=0

" Use z for fold toggling
nnoremap z za
vnoremap z za

"TODO: Add command to fold everything to a method-level.
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

"}}}

"{{{ Appearance

colorscheme railscasts

" Remove toolbars in case we're running gvim
set guioptions=aci

"}}}
