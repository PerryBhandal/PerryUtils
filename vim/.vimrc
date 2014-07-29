
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" ************START PERSONAL SETTINGS "

" Set up Vundle "

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Below installs vundle. This shows how you can enable a vim plugin from GH as
" well
Plugin 'gmarik/Vundle.vim'
" Below installs endwise (automatic closing tags). This is hosted on vim
" scripts. So in this case the specific plugin is the one here
" http://www.vim.org/scripts/script.php?script_id=2386
Plugin 'endwise.vim'

Plugin 'bling/vim-airline' " Status bar
Plugin 'tpope/vim-fugitive' " Git

Plugin 'ecomba/vim-ruby-refactoring' " Refactoring for Ruby
Plugin 'matchit.zip' " Dependency for some of Ruby refactoring's methods

Bundle 'vim-ruby/vim-ruby'
Plugin 'scrooloose/syntastic'

Plugin 'Valloric/YouCompleteMe'

Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'

Plugin 'scrooloose/nerdtree'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Don't store any backups, just :w constantly! "
set nobackup
set noswapfile

" Settings for solarized (theme) plugin "
" Show line numbers "
set number

"Disable search highlighting by default"
set nohls

" Use ruby lint instead of mri and keep the loc list always visible
let g:syntastic_ruby_checkers = ['rubylint']
let g:syntastic_always_populate_loc_list = 1
"Removed this for now, disliked the delay on load: let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list=1

" Neocomplcache is another auto completion library. Using this as it has
" support for local fs checking require_relative

let g:neocomplcache_enable_at_startup = 1

" Make ctrl + n open nerd tree 

map <C-n> :NERDTreeToggle<CR>

" Set folding
set foldenable
set foldmethod=syntax
set foldnestmax=3

" Enable ` to cyce between screens"
nnoremap <silent> ` <c-w><c-w>

colorscheme railscasts
" *********** END PERSONAL SETTINGS "
