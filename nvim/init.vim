set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing

" Plugins START



call plug#begin()



    " Required for vim 8
    Plug 'roxma/vim-hug-neovim-rpc'
    " Install this plugin
    Plug 'roxma/nvim-yarp', { 'do': 'pip install -r requirements.txt' }

    " assuming you're using vim-plug: https://github.com/junegunn/vim-plug
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'

    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " NOTE: you need to install completion sources to get completions. Check
    " our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
    Plug 'ncm2/ncm2-bufword'
    Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()


" Plugins END

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
filetype plugin on

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

" supress the annoying 'match x of y', 'The only match' and 'Patter not found'
" messages
" set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new line
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")


    " suppress the annoying 'match x of y', 'The only match' and 'Pattern not
    " found' messages
    set shortmess+=c

    " CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
    inoremap <c-c> <ESC>

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new
    " line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " Use <TAB> to select the popup menu:
inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"

inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"

    " wrap existing omnifunc
    " Note that omnifunc does not run in background and may probably block the
    " editor. If you don't want to be blocked by omnifunc too often, you could
    " add 180ms delay before the omni wrapper:
    "  'on_complete': ['ncm2#on_complete#delay', 180,
    "               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
    au User Ncm2Plugin call ncm2#register_source({
            \ 'name' : 'css',
            \ 'priority': 9,
            \ 'subscope_enable': 1,
            \ 'scope': ['css','scss'],
            \ 'mark': 'css',
            \ 'word_pattern': '[\w\-]+',
            \ 'complete_pattern': ':\s*',
            \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
            \ })

set nocompatible " Ensure this always remains at the top as it has side effects.

set guifont=Monospace\ 10.5

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

inoremap <silent> <c-s> <esc>:w<cr>:call SyntasticCheck()<cr>
nnoremap <silent> <c-s> :w<cr>:call SyntasticCheck()<cr>


" Use tab to cycle through buffers and tabs 
"nnoremap <tab> :Bufferlist<cr>
"nnoremap <s-tab> :tabnext<cr>

" Ensures underscores show.
set linespace=2

nnoremap <F3> :setlocal spell! spelllang=en_us<CR>

" Open git status
nnoremap <c-k> :Git<cr>
nnoremap <a-k> :Git commit -m "
nnoremap <c-l> :Git diff<cr>

nnoremap <c-a> <esc>ggvG<s-$>


 " BEGIN NERDTREE                                                                
Plug 'scrooloose/nerdtree'                                                    
map <a-p> :NERDTreeToggle<CR>                                                   
" Auto close side file window when we select a file.                            
let NERDTreeQuitOnOpen=1                                                        
let NERDTreeShowHidden=1                                                        
"END NERD TREE

" Copy paste
nnoremap y "+y
vnoremap y "+y
nnoremap p "+p
vnoremap p "+p
