" Use Vim settings, rather than Vi settings
set nocompatible
" required for Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required for Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails.git'
Bundle 'kien/ctrlp.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'myusuf3/numbers.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/VimClojure'

"Colors!
Bundle 'vim-scripts/desert256.vim'
":colorscheme desert256
Bundle 'ciaranm/inkpot'
":colorscheme inkpot
Bundle 'vim-scripts/256-grayvim'
":colorscheme 256-grayvim
Bundle 'vim-scripts/The-Vim-Gardener'
":colorscheme gardener
Bundle 'altercation/vim-colors-solarized'
colorscheme solarized
if has('gui_running')
  set background=light
else
  set background=dark
endif

" required for Vundle
filetype plugin indent on

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
set numberwidth=5
set ruler

" Syntax highlighting
syntax on
set hlsearch

" Display extra whitespace
set list
set listchars=tab:>-,trail:.

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

" VimClojure stuff
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1
let vimclojure#FuzzyIndent=1
autocmd BufRead,BufNewFile *.cljs setlocal filetype=clojure

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

" autocmd FileWritePre * :call TrimWhiteSpace()
" autocmd FileAppendPre * :call TrimWhiteSpace()
" autocmd FilterWritePre * :call TrimWhiteSpace()
" autocmd BufWritePre * :call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>
