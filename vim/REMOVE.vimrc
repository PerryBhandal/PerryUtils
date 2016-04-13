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
nnoremap <s-j> 10j
nnoremap <s-k> 10k
nnoremap <s-b> 10b
nnoremap <s-w> 10w



vnoremap <s-j> 10j
vnoremap <s-k> 10k
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
nnoremap <c-l> :Gdiff<cr>

nnoremap <c-a> <esc>ggvG<s-$>

" Auto indent pastes to surrounding code
vnoremap p "_dP
" TODO: Quit 

" TODO: Save on ctrl + s
nnoremap <c-b> <c-]>

""" Begin Git hotkeys
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

autocmd FileType javascript setlocal omnifunc=tern#Complete
Plugin 'ternjs/tern_for_vim'


"""Begin Plugins

Plugin 'davidhalter/jedi-vim'

" Appearance
Plugin 'tomasr/molokai'

" Source Control
Plugin 'tpope/vim-fugitive'

" Ag vim
Plugin 'rking/ag.vim'

Plugin 'toyamarinyon/vim-swift'

Plugin 'xuhdev/vim-latex-live-preview'

" UI Elements
Plugin 'bling/vim-airline'

Plugin 'klen/python-mode'

Plugin 'mitsuhiko/vim-jinja'

Plugin 'jaxbot/browserlink.vim'

" JAVASCRIPT BEGIN
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
au BufNewFile,BufRead *.js set filetype=javascript.jsx
au BufNewFile,BufRead *.js.py set filetype=python.javascript
" JAVASCRIPT END


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
set wildignore+=*.pyc,*/venv/*,*/node_modules/*,*/target/*
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
set foldlevel=100
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

function! StartProfiling()
	profile start profile.log
	profile func *
	profile file *
endfunction
command StartProfiling :call StartProfiling()

function! StopProfiling()
	profile pause
	noautocmd qall!
endfunction
command StopProfiling :call StopProfiling()


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
au BufNewFile,BufRead *.swift set filetype=swift
"
"}}}

" Commenting, Can do ,cc to comment lines and ,cu to uncomment.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif
