set noswapfile

" Use Vim settings, rather than Vi settings
set nocompatible

call plug#begin('~/.local/share/nvim/plugged')

" General plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'kien/rainbow_parentheses.vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'myusuf3/numbers.vim'

" JS
Plug 'isRuslan/vim-es6'
Plug 'mattn/webapi-vim' " Needed for vim-babel
Plug 'jbgutierrez/vim-babel'

" Clojure
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-clojure-highlight'

" Etc
Plug 'tpope/vim-cucumber'

" Unused plugins
" Plug 'mxw/vim-jsx'
" Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-rails.git'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-haml'
" Plug 'juvenn/mustache.vim'
" Plug 'othree/yajs.vim'
" Plug 'airblade/vim-gitgutter'
" Plug 'wavded/vim-stylus'
" Plug 'tpope/vim-classpath'
" Plug 'kchmck/vim-coffee-script'
" Plug 'godlygeek/tabular'

call plug#end()

" Colors!
colorscheme solarized
if has('gui_running')
  set background=light
else
  set background=dark
endif

" Soft tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" Display incomplete commands
set showcmd

" Line numbers
set number
set ruler

" Syntax highlighting
syntax on
set hlsearch
set incsearch

" Display extra whitespace
set list
set listchars="tab:> ,trail:-,nbsp:+"

" case only matters with mixed case expressions
set ignorecase
set smartcase

" Tab completion options
" (only complete to the longest unambiguous match, and show a menu)
set completeopt=longest,menu
set wildmode=list:longest,list:full

set guifont=Panic\ Sans:h13
"256 colors
set t_Co=256

set nowrap

" Ignore dumb files
set wildignore+=.git,tmp,log,*.png,*.jpg,*.jpeg,*.gif,public/analytic,public/fonts,public/sounds,public/images,public/flash

" Key mappings
nnoremap <F3> :NumbersToggle<CR>

" Strip whitespace
function! TrimWhiteSpace()
  %s/\s*$//
  ''
:endfunction

autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FilterWritePre * :call TrimWhiteSpace()
autocmd BufWritePre * :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" rainbow_parenthesis.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.sass-cache$|\.hg$\|\.svn$\|\.yardoc\|public$|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
