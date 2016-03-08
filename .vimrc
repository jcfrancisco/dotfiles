" Use Vim settings, rather than Vi settings
set nocompatible
" required for Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" My Plugins here:
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'isRuslan/vim-es6'
Plugin 'jbgutierrez/vim-babel'
Plugin 'mattn/webapi-vim'
Plugin 'tpope/vim-cucumber'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'myusuf3/numbers.vim'
Plugin 'guns/vim-clojure-static'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-highlight'
Plugin 'altercation/vim-colors-solarized'

" Unused plugins
" Plugin 'mxw/vim-jsx'
" Plugin 'plasticboy/vim-markdown'
" Plugin 'tpope/vim-rails.git'
" Plugin 'tpope/vim-endwise'
" Plugin 'tpope/vim-haml'
" Plugin 'juvenn/mustache.vim'
" Plugin 'othree/yajs.vim'
" Plugin 'airblade/vim-gitgutter'
" Plugin 'wavded/vim-stylus'
" Plugin 'tpope/vim-classpath'

call vundle#end()
" required for Vundle
filetype plugin indent on

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
