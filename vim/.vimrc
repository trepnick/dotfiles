""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on

" Highligh
syntax on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations like <leader>w
" saves the current file
let mapleader = ','
let g:mapleader = ','
let maplocalleader = ';'
let g:maplocalleader = ';'

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" Indent
filetype indent on

" Insert space characters whenever the tab key is pressed
set tabstop=4
set shiftwidth=4
set expandtab

" Read modelines at the end and begging
set modeline

" Vim insert delete over line breaks, or automatically-inserted indentation
set backspace=indent,eol,start

" Set relative numbers
set relativenumber

" Position of cursor
set ruler

" Better wrapping
set breakindent
set showbreak=\\\\\

" Only syntax highlighting the first 200 characters of each line.
"set synmaxcol=200

" Opening new files via :e, a breeze with TAB expansion.
set wildmenu
set wildmode=full

" Folding
set foldmethod=syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Save movements larger than 5 lines to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" Buffer movement
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
"set viminfo^=%

" Clipboard to use it exterior
set clipboard=unnamedplus

" Format-Flowed text
setlocal fo+=aw

" Escape using jj
imap jj <Esc>

""""""""""""""
"  Filetype  "
""""""""""""""
au FileType mail setlocal sw=2 sts=2 textwidth=0 wrapmargin=0 wrap linebreak nolist
au FileType vimwiki  setlocal tabstop=2 shiftwidth=2 expandtab
au FileType javascript  setlocal tabstop=2 shiftwidth=2 expandtab
au FileType json  setlocal tabstop=2 shiftwidth=2 expandtab
au FileType typescript  setlocal tabstop=2 shiftwidth=2 expandtab
au FileType markdown  setlocal tabstop=2 shiftwidth=2 expandtab
au FileType text  setlocal tabstop=2 shiftwidth=2 expandtab
au FileType html  setlocal tabstop=2 shiftwidth=2 expandtab
au FileType yaml  setlocal tabstop=2 shiftwidth=2 expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Set local language (en_us, en_gb, fr, es)
nmap <Leader>se :setlocal spell! spelllang=en_us<CR>

" Automatically correct spell with first suggestion
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"""""""""""""""
"  Shortcuts  "
"""""""""""""""

map <F8> : !w <bar> ./% <CR> " Compile
nnoremap <F5> :w <CR> :!make <CR> " Makefile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'tmhedberg/SimpylFold'
Plug 'airblade/vim-gitgutter'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-jedi'
Plug 'fszymanski/deoplete-emoji'
Plug 'hkupty/iron.nvim'
Plug 'davidhalter/jedi-vim'
Plug 'edkolev/promptline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }  " File manager <F3>
Plug 'w0rp/ale' " Asynchronous linter <leader>sc
Plug 'tpope/vim-fugitive' " Git-vim
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons' " Icons to vim
Plug 'christoomey/vim-tmux-navigator' " Seamlesss motion tmux-vim <C-j>
Plug 'luochen1990/rainbow' " Parentheses highlight <leader>R
Plug 'ervandew/supertab'
Plug 'joshdick/onedark.vim'
call plug#end()

""""""""""""""""""""
"  NerdTreeToogle  "
""""""""""""""""""""
" Ignore files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Disable that old Press ? for help
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 0

" Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1

" Activate with <F3>
nmap <silent> <F3> :NERDTreeToggle<CR>

"""""""""""""
"  Airline  "
"""""""""""""
" Dont use whitespace
let g:airline#extensions#whitespace#enabled = 0

" Use tabline
let g:airline#extensions#tabline#enabled = 1

" Use branch
let g:airline#extensions#branch#enabled=1

" Use hunks
let g:airline#extensions#hunks#enabled=0

" Use powerline fonts
let g:airline_powerline_fonts = 1

" Theme
let g:airline_theme='onedark'

""""""""""""""
"  Tmuxline  "
""""""""""""""
" Create snapshot using: 'TmuxlineSnapshot! .tmux.theme'
"
" use airline
let g:airline#extensions#tmuxline#enabled = 1

" Conf tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#W'],
      \'cwin' : '#F #W',
      \'z'    : '%R'}

""""""""""""""""
"  Promptline  "
""""""""""""""""
" Create snapshot using ':PromptlineSnapshot! .shell_prompt.sh airline'
"
" Conf promptline
let g:promptline_preset = {
        \'a'    : [ promptline#slices#host() ],
        \'b'    : [ promptline#slices#cwd() ],
        \'c'    : [ promptline#slices#vcs_branch() ],
        \'warn' : [ promptline#slices#last_exit_code() ],
        \'z'    : [ promptline#slices#python_virtualenv() ]}

"""""""""""""""""""""""""""
"  Jedi: python vim help  "
"""""""""""""""""""""""""""
let python_highlight_all = 1

" Completions command
"let g:jedi#completions_command = '<C-N>'
let g:jedi#completions_enabled = 1

" See usages of a variable
let g:jedi#usages_command = '<leader>z'

" Dont show popup when writing dot
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

" Max doc height
let g:jedi#max_doc_height = 30

" No automatic import after
let g:jedi#smart_auto_mappings = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Work with virtualenvs
let g:python3_host_prog = '/bin/python3' " Python 3

" Show jedi docstrings
let g:deoplete#sources#jedi#show_docstring = 1

""""""""""""""""
"  Easy align  "
""""""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Ale: requires flake8 for python and vint for vim lighting (pip install
"  vim-vint  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle ALE with <leader>sc
nnoremap <leader>sc :ALEToggle<CR>

" Not enable by default
let g:ale_enabled = 0

" Do compleition
let g:ale_completion_enabled = 1

let g:ale_linters = {'python': ['flake8', 'mypy', 'pylint']}

" Use fixers
"let g:ale_fixers = {
"\   'javascript': ['eslint'],
"\   'python': ['autopep8', 'yapf'],
"\   'vim': ['vint'],
"\}

"""""""""""
"  Theme  "
"""""""""""
" Black theme
set background=dark
"set background=light

" Add underline syntax details
syntax enable

" Set color scheme
colorscheme onedark

""""""""""""""
"  Fugitive  "
""""""""""""""
" When doing Gdiff make a vertical split by default
set diffopt+=vertical

"""""""""""""""""""""""""""
"  Git gutter (git diff)  "
"""""""""""""""""""""""""""
" Not enable by default
let g:gitgutter_enabled=1

" Activate using <leader>d
nnoremap <silent> <leader>d :GitGutterToggle<cr>

"""""""""""""""""""""""""
"  Rainbow Parentheses  "
"""""""""""""""""""""""""
" 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

" Toggle rainbow with <leader>R
nmap <leader>R :RainbowToggle<cr>

""""""""""""
"  Neovim  "
""""""""""""
if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <M-[> <Esc>
    tnoremap <C-v><Esc> <Esc>
    nmap <localleader>t <Plug>(iron-send-motion)
    autocmd TermOpen * set bufhidden=hide
    au TermOpen * setlocal nonumber norelativenumber
    :hi! TermCursorNC ctermfg=15 guifg=#fdf6e3 ctermbg=14 guibg=#93a1a1 cterm=NONE gui=NONE
endif

nmap <localleader>t <Plug>(iron-send-motion)
let g:iron_new_python_repl_hooks='ipython'

set termguicolors " Enable true color support.
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
