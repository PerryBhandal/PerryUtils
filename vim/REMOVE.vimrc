"""
" .vimrc
" Author: Perry Bhandal
"""

"{{{ Basic Settings

set nocompatible
set autoindent
set history=50
set showcmd

if has('mouse')
	set mouse=a
end

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

"}}}

"{{{ Appearance

colorscheme railscasts

" Remove toolbars in case we're running gvim
set guioptions=aci

"}}}
